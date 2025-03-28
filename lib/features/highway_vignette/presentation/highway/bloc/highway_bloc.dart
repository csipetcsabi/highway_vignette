import 'dart:async';

import 'package:bloc/bloc.dart';

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

  HighwayBloc(this.repository) : super(HighwayInitial()) {
    on<VignetteSelected>(_onVignetteSelected);
    on<PurchaseRequested>(_onPurchaseRequested);
    on<CountyVignettesOpened>(_onCountyVignettesOpened);

    _fetchInfos();
  }

  FutureOr<void> _onVehicleDataLoadRequested() async {
    emit(const VehicleInfoLoading());
    try {
      final GetV1HighwayVehicleResponse vehicleInfo =
          await repository.getVehicleInfo();
      emit(VehicleInfoLoaded(vehicleInfo));
    } catch (e) {
      //fixme
      emit(DataLoadFailed(e.toString()));
    }
  }

  FutureOr<void> _onHighwayDataLoadRequested() async {
    emit(const HighwayInfoLoading());
    try {
      final GetV1HighwayInfoResponse highwayInfo =
          await repository.getHighwayInfo();
      _processHighwayInfo(highwayInfo);
    } catch (e) {
      //fixme
      emit(DataLoadFailed(e.toString()));
    }
  }

  void _processHighwayInfo(GetV1HighwayInfoResponse highwayInfo) {
    //fixme filter vignette by types
    payload = highwayInfo.payload;


    List<HighwayVignettes> payloads = highwayInfo.payload.highwayVignettes;
    List<HighwayVignettes> filteredPayloads = filterPayloads(payloads);

    emit(HighwayInfoLoaded(filteredPayloads));
  }

  FutureOr<void> _onVignetteSelected(
    VignetteSelected event,
    Emitter<HighwayState> emit,
  ) {
    emit(VignetteIsSelected(vignetteType: event.vignetteType));
  }

  FutureOr<void> _onPurchaseRequested(
    PurchaseRequested event,
    Emitter<HighwayState> emit,
  ) async {
    _fetchInfos();

    //emit(const Purchasing());
  }

  FutureOr<void> _onCountyVignettesOpened(
    CountyVignettesOpened event,
    Emitter<HighwayState> emit,
  ) {
    //fixme
    _fetchInfos();
    emit(const CountyVignettesAreOpened());
  }

  void _fetchInfos() {
    _onVehicleDataLoadRequested();
    _onHighwayDataLoadRequested();
  }

  List<HighwayVignettes> filterPayloads(List<HighwayVignettes> payloads) {
    List<String> filteredVignetteTypes = ['DAY', 'MONTH', 'WEEK'];
    return payloads.where((payload) {
      final List<String> vignetteTypes = List<String>.from(payload.vignetteType);
      return vignetteTypes.any((type) => filteredVignetteTypes.contains(type));
    }).toList();
  }
}
