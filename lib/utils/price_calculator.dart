import 'package:highway_vignette/api/export.dart';

import '../features/highway_vignette/domain/models/vignette_type.dart';

mixin PriceCalculatorMixin {
  double usageFee = 110.0;

  String getVignetteName(String vignette, Payload payload) {
    VignetteType vignetteType = VignetteType.getByKey(vignette);
    if (vignetteType == VignetteType.year) {
      return getCountyNameById(vignette, payload);
    } else {
      return vignetteType.getLocalizedText();
    }
  }

  String getCountyNameById(String id, Payload payload) {
    return payload.counties.firstWhere((item) => item.id.contains(id)).name;
  }

  String getVignettePrice(String vignette, Payload payload) {
    return getVignette(vignette, payload).sum.toString();
  }

  HighwayVignettes getVignette(String vignette, Payload payload) {
    return payload.highwayVignettes.firstWhere(
      (item) => item.vignetteType.contains(vignette),
    );
  }

  double calculateTax(List<String> vignettesList, Payload payload) {
    double totalTax = 0.0;
    for (String vignette in vignettesList) {
      HighwayVignettes highwayVignette = getVignette(vignette, payload);
      totalTax += highwayVignette.trxFee;
    }

    return totalTax;
  }

  String calculateTotalPrice(
    List<String> vignettes,
    Payload payload, {
    bool withTax = false,
  }) {
    double totalPrice = 0.0;
    for (String vignette in vignettes) {
      HighwayVignettes highwayVignette = getVignette(vignette, payload);
      totalPrice += highwayVignette.sum;
    }
    if (withTax) {
      totalPrice += usageFee;
    }

    return "${totalPrice.round()} Ft";
  }
}
