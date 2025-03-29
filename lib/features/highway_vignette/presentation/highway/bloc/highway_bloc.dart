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

  FutureOr<void> _onVehicleInfoLoadRequested(Emitter<HighwayState> emit) async {
    emit(const VehicleInfoLoading());
    try {
      vehicleInfo =
          await repository.getVehicleInfo();
      emit(VehicleInfoLoaded(vehicleInfo!));
    } catch (e) {
      //fixme
      emit(DataLoadFailed(e.toString()));
    }
  }

  FutureOr<void> _onHighwayInfoLoadRequested(Emitter<HighwayState> emit) async {
    emit(const HighwayInfoLoading());
    try {
      final GetV1HighwayInfoResponse highwayInfo =
          await repository.getHighwayInfo();
      _processHighwayInfo(highwayInfo, emit);
    } catch (e) {
      //fixme
      emit(DataLoadFailed(e.toString()));
    }
  }

  void _processHighwayInfo(GetV1HighwayInfoResponse highwayInfo, Emitter<HighwayState> emit) {
    //fixme filter vignette by types
    payload = highwayInfo.payload;


    List<HighwayVignettes> payloads = highwayInfo.payload.highwayVignettes;
    List<HighwayVignettes> filteredPayloads = filterPayloads(payloads);

    emit(HighwayInfoLoaded(filteredPayloads));
  }


  FutureOr<void> _onPurchaseRequested(
    PurchaseRequested event,
    Emitter<HighwayState> emit,
  ) async {
    if (vehicleInfo != null) {
      emit(PurchaseConfirmationOpened(event.vignette, vehicleInfo!));
    }
  }

  FutureOr<void> _onCountyVignettesOpened(
    CountyVignettesOpened event,
    Emitter<HighwayState> emit,
  ) {
    //fixme
    _fetchInfos(emit);
    emit(const CountyVignettesAreOpened());
  }

  void _fetchInfos(Emitter<HighwayState> emit) {
    _onVehicleInfoLoadRequested(emit);
    _onHighwayInfoLoadRequested(emit);
  }

  List<HighwayVignettes> filterPayloads(List<HighwayVignettes> payloads) {
    List<String> filteredVignetteTypes = ['DAY', 'MONTH', 'WEEK'];
    return payloads.where((payload) {
      final List<String> vignetteTypes = List<String>.from(payload.vignetteType);
      return vignetteTypes.any((type) => filteredVignetteTypes.contains(type));
    }).toList();
  }

  FutureOr<void> _onHighwayFetchInfo(HighwayFetchInfosEvent event, Emitter<HighwayState> emit) {
    _fetchInfos(emit);
  }
}
