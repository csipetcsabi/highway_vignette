import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:highway_vignette/features/highway_vignette/domain/models/args/confirmation_page_args.dart';
import 'package:highway_vignette/features/highway_vignette/domain/models/vignette_type.dart';

import '../../../../../api/models/highway_vignettes.dart';

part 'confirmation_event.dart';
part 'confirmation_state.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {
  double usageFee = 110.0;

  ConfirmationPageArgs args;

  ConfirmationBloc(this.args) : super(ConfirmationInitial()) {
    on<ConfirmationEvent>((event, emit) {
      // TODO: implement event handler
    });
    calculate();
  }

  void calculate() {
    emit(
      ConfirmationLoaded(
        plateNumber: args.vehicleInfo.plate,
        vignetteType:
            VignetteType.getByKey(
              args.vignettes.first.vignetteType.first,
            ).getLocalizedText(),
        vignettes: generateVignettePriceRows(args.vignettes),
        tax: calculateTax(args.vignettes).toString(),
        totalPrice: calculateTotalPrice(args.vignettes),
        systemUsageFee: "${usageFee.round()} Ft",
      ),
    );
  }

  List<VignettePriceRow> generateVignettePriceRows(
    List<HighwayVignettes> vignettes,
  ) {
    List<VignettePriceRow> vignettePriceRows = [];
    for (HighwayVignettes vignette in vignettes) {
      vignettePriceRows.add(
        VignettePriceRow(
          VignetteType.getByKey(
            args.vignettes.first.vignetteType.first,
          ).getLocalizedText(),
          (vignette.sum.round()).toString(),
        ),
      );
    }
    return vignettePriceRows;
  }

  double calculateTax(List<HighwayVignettes> vignettes) {
    double totalTax = 0.0;
    for (HighwayVignettes vignette in vignettes) {
      totalTax += vignette.trxFee;
    }
    return totalTax;
  }

  String calculateTotalPrice(List<HighwayVignettes> vignettes) {
    double totalPrice = 0.0;
    for (HighwayVignettes vignette in vignettes) {
      totalPrice += vignette.sum;
    }
    totalPrice += usageFee;
    return "${totalPrice.round()} Ft";
  }

  void calculateState() {}
}

class VignettePriceRow {
  String vignetteName;
  String vignettePrice;

  VignettePriceRow(this.vignetteName, this.vignettePrice);
}
