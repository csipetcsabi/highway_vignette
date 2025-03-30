part of 'highway_bloc.dart';

sealed class HighwayState   {
  const HighwayState();
}

final class HighwayInitial extends HighwayState {
}


final class HighwayInfoLoading extends HighwayState {
  const HighwayInfoLoading();
}


final class HighwayInfoLoaded extends HighwayState {
  final List<HighwayVignettes> vignettes;
  final GetV1HighwayVehicleResponse data;
  const HighwayInfoLoaded(this.vignettes, this.data);
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
  Payload payload;
  CountyVignettesAreOpened(this.payload);
}
