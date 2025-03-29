part of 'highway_bloc.dart';

sealed class HighwayState   {
  const HighwayState();
}

final class HighwayInitial extends HighwayState {
}

final class VehicleInfoLoading extends HighwayState {
  const VehicleInfoLoading();
}

final class HighwayInfoLoading extends HighwayState {
  const HighwayInfoLoading();
}

final class VehicleInfoLoaded extends HighwayState {
  final GetV1HighwayVehicleResponse data;
  const VehicleInfoLoaded(this.data);
}

final class HighwayInfoLoaded extends HighwayState {
  final List<HighwayVignettes> vignettes;
  const HighwayInfoLoaded(this.vignettes);
}

final class DataLoadFailed extends HighwayState {
  final String errorMessage;
  const DataLoadFailed(this.errorMessage);
}



final class PurchaseConfirmationOpened extends HighwayState {
  HighwayVignettes vignette;
  GetV1HighwayVehicleResponse vehicleInfo;
  PurchaseConfirmationOpened(this.vignette, this.vehicleInfo);
}


final class CountyVignettesAreOpened extends HighwayState {
  const CountyVignettesAreOpened();
}
