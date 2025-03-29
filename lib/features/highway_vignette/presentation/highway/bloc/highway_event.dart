part of 'highway_bloc.dart';

sealed class HighwayEvent   {
  const HighwayEvent();
}

class PurchaseRequested extends HighwayEvent {
  HighwayVignettes vignette;
  PurchaseRequested(this.vignette);
}

class CountyVignettesOpened extends HighwayEvent {
  // Nincs szükség extra adatra, ha csak a nézetet nyitjuk meg.
}
