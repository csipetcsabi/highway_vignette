part of 'highway_bloc.dart';

sealed class HighwayState   {
  const HighwayState();
}

final class HighwayInitial extends HighwayState {

}

final class DataLoading extends HighwayState {
  const DataLoading();
}

final class DataLoaded extends HighwayState {
  final GetV1HighwayVehicleResponse data;

  const DataLoaded(this.data);
}

final class DataLoadFailed extends HighwayState {
  final String errorMessage;

  const DataLoadFailed(this.errorMessage);
}

final class VignetteIsSelected extends HighwayState {
  final String vignetteType; //pl: éves, havi, heti

  const VignetteIsSelected({required this.vignetteType});
}

final class Purchasing extends HighwayState {
  const Purchasing();
}

final class PurchaseSuccess extends HighwayState {
  const PurchaseSuccess();
}

final class PurchaseFailed extends HighwayState {
  final String errorMessage;

  const PurchaseFailed(this.errorMessage);
}

final class CountyVignettesAreOpened extends HighwayState {
  const CountyVignettesAreOpened();
}
