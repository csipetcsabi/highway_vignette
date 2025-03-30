part of 'highway_bloc.dart';

sealed class HighwayEvent   {
  const HighwayEvent();
}

class HighwayFetchInfosEvent extends HighwayEvent {
  const HighwayFetchInfosEvent();
}

class PurchaseRequested extends HighwayEvent {
  String vignette;
  PurchaseRequested(this.vignette);
}

class CountyVignettesOpened extends HighwayEvent {
}
