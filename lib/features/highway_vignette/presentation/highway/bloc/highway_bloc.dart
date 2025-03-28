import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../../api/models/get_v1_highway_vehicle_response.dart';
import '../../../domain/repository/highway_repository.dart';

part 'highway_event.dart';
part 'highway_state.dart';

class HighwayBloc extends Bloc<HighwayEvent, HighwayState> {
  final HighwayRepository repository;

  HighwayBloc(this.repository) : super(HighwayInitial()) {
    on<DataLoadRequested>(_onDataLoadRequested);
    on<VignetteSelected>(_onVignetteSelected);
    on<PurchaseRequested>(_onPurchaseRequested);
    on<CountyVignettesOpened>(_onCountyVignettesOpened);

    this.add(DataLoadRequested());
  }

  FutureOr<void> _onDataLoadRequested(
    DataLoadRequested event,
    Emitter<HighwayState> emit,
  ) async {
    emit(const DataLoading());

    try {
      final GetV1HighwayVehicleResponse vehicleInfo =
          await repository.getVehicleInfo();
      emit(DataLoaded(vehicleInfo));
    } catch (e) {
      //fixme
      emit(DataLoadFailed('Hiba történt a letöltés során!'));
    }
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
    emit(const Purchasing());
  }

  FutureOr<void> _onCountyVignettesOpened(
    CountyVignettesOpened event,
    Emitter<HighwayState> emit,
  ) {
    emit(const CountyVignettesAreOpened());
  }
}
