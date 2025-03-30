import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../api/models/get_v1_highway_info_response.dart';
import '../../../../../api/models/get_v1_highway_vehicle_response.dart';
import '../../../../../api/models/highway_vignettes.dart';
import '../../../../../api/models/payload.dart';
import '../../../domain/repository/highway_repository.dart';

part 'highway_event.dart';
part 'highway_state.dart';

class HighwayBloc extends Bloc<HighwayEvent, HighwayState> {
  final HighwayRepository repository;

  Payload? payload;
  GetV1HighwayVehicleResponse? vehicleInfo;

  HighwayBloc(this.repository) : super(HighwayInitial()) {
    on<PurchaseRequested>(_onPurchaseRequested);
    on<CountyVignettesOpened>(_onCountyVignettesOpened);
    on<HighwayFetchInfosEvent>(_onHighwayFetchInfo);
    add(HighwayFetchInfosEvent());
  }

  Future<GetV1HighwayVehicleResponse?> _onVehicleInfoLoadRequested() async {
    vehicleInfo = await repository.getVehicleInfo();
    return vehicleInfo;
  }

  Future<List<HighwayVignettes>> _onHighwayInfoLoadRequested() async {
    final GetV1HighwayInfoResponse highwayInfo =
        await repository.getHighwayInfo();
    return _processHighwayInfo(highwayInfo);
  }

  List<HighwayVignettes> _processHighwayInfo(
    GetV1HighwayInfoResponse highwayInfo,
  ) {
    //fixme filter vignette by types
    payload = highwayInfo.payload;

    List<HighwayVignettes> payloads = highwayInfo.payload.highwayVignettes;
    List<HighwayVignettes> filteredPayloads = filterPayloads(payloads);
    return filteredPayloads;
  }

  FutureOr<void> _onPurchaseRequested(
    PurchaseRequested event,
    Emitter<HighwayState> emit,
  ) async {
    if (vehicleInfo != null) {
      emit(PurchaseConfirmationOpened(event.vignette, vehicleInfo!));
    }
  }

  Future<void> _onCountyVignettesOpened(
    CountyVignettesOpened event,
    Emitter<HighwayState> emit,
  ) async {
    if (payload != null) {
      emit(CountyVignettesAreOpened(payload!));
    }
  }

  Future<void> _fetchInfos(Emitter<HighwayState> emit) async {
    emit(const HighwayInfoLoading());
    try {
      final results = await Future.wait([
        _onVehicleInfoLoadRequested(),
        _onHighwayInfoLoadRequested(),
      ]);

      final GetV1HighwayVehicleResponse vehicleInfo =
          results[0] as GetV1HighwayVehicleResponse;
      final List<HighwayVignettes> highwayInfo =
          results[1] as List<HighwayVignettes>;
      emit(HighwayInfoLoaded(highwayInfo, vehicleInfo));
    } catch (e) {
      //fixme
      emit(DataLoadFailed(e.toString()));
    }
  }

  List<HighwayVignettes> filterPayloads(List<HighwayVignettes> payloads) {
    List<String> filteredVignetteTypes = ['DAY', 'MONTH', 'WEEK'];
    return payloads.where((payload) {
      final List<String> vignetteTypes = List<String>.from(
        payload.vignetteType,
      );
      return vignetteTypes.any((type) => filteredVignetteTypes.contains(type));
    }).toList();
  }

  Future<void> _onHighwayFetchInfo(
    HighwayFetchInfosEvent event,
    Emitter<HighwayState> emit,
  ) async {
    await _fetchInfos(emit);
  }
}
