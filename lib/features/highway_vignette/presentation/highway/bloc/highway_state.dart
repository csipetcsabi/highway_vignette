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
  String vignette;
  GetV1HighwayVehicleResponse vehicleInfo;
  Payload payload;
  PurchaseConfirmationOpened(this.vignette, this.vehicleInfo, this.payload);
}


final class CountyVignettesAreOpened extends HighwayState {
  Payload payload;
  GetV1HighwayVehicleResponse vehicleInfo;
  CountyVignettesAreOpened(this.payload, this.vehicleInfo);
}
