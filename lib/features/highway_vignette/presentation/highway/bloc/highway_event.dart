part of 'highway_bloc.dart';

sealed class HighwayEvent   {
  const HighwayEvent();
}

class VignetteSelected extends HighwayEvent {
  final String vignetteType; //pl: éves, havi, heti

  VignetteSelected({required this.vignetteType});
}

class PurchaseRequested extends HighwayEvent {

  PurchaseRequested();
}

class CountyVignettesOpened extends HighwayEvent {
  // Nincs szükség extra adatra, ha csak a nézetet nyitjuk meg.
}
