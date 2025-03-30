import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highway_vignette/features/highway_vignette/domain/models/args/confirmation_page_args.dart';
import 'package:highway_vignette/features/highway_vignette/domain/models/vignette_type.dart';
import 'package:highway_vignette/features/highway_vignette/domain/repository/highway_repository.dart';

import '../../../../../api/models/highway_orders.dart';
import '../../../../../api/models/highway_vignettes.dart';
import '../../../../../api/models/object0.dart';
import '../../../../../api/models/post_v1_highway_order_response.dart';

part 'confirmation_event.dart';
part 'confirmation_state.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {
  double usageFee = 110.0;

  ConfirmationPageArgs args;
  HighwayRepository repository;

  ConfirmationBloc(this.args, this.repository) : super(ConfirmationInitial()) {
    on<ConfirmationEvent>((event, emit) {});
    on<ConfirmationRequested>(_onConfirmationRequested);
    on<CalculateRequested>(_onCalculateRequested);
    add(CalculateRequested());
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

  Future<void> _onConfirmationRequested(
    ConfirmationRequested event,
    Emitter<ConfirmationState> emit,
  ) async {
    emit(ConfirmationLoading());

    try {
      List<HighwayOrders> highwayOrders = [];
      args.vignettes.forEach((item) {
        HighwayOrders highwayOrder = HighwayOrders(
          type: item.vignetteType.first,
          category: item.vehicleCategory,
          cost: item.cost,
        );
        highwayOrders.add(highwayOrder);
      });

      Object0 object0 = Object0(highwayOrders: highwayOrders);
      PostV1HighwayOrderResponse response = await repository.postHighwayOrder(
        object0,
      );
      if (response.statusCode != "OK") {
        emit(ConfirmationFailed("Error: ${response.statusCode}"));
        return;
      }
      emit(ConfirmationSuccess());
    } catch (e) {
      emit(ConfirmationFailed(e.toString()));
    }
  }

  FutureOr<void> _onCalculateRequested(
    CalculateRequested event,
    Emitter<ConfirmationState> emit,
  ) {
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
}

class VignettePriceRow {
  String vignetteName;
  String vignettePrice;

  VignettePriceRow(this.vignetteName, this.vignettePrice);
}
