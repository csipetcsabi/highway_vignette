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
import '../../../../../utils/price_calculator.dart';
import '../../../domain/models/vidgette_price_row.dart';

part 'confirmation_event.dart';
part 'confirmation_state.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState>
    with PriceCalculatorMixin {
  @override
  double usageFee = 110.0;

  ConfirmationPageArgs args;
  HighwayRepository repository;

  ConfirmationBloc(this.args, this.repository) : super(ConfirmationInitial()) {
    on<ConfirmationEvent>((event, emit) {});
    on<ConfirmationRequested>(_onConfirmationRequested);
    on<ConfirmationLoadDatasEvent>(_onLoadDatas);
    add(ConfirmationLoadDatasEvent());
  }

  List<VignettePriceRow> generateVignettePriceRows(List<String> vignettes) {
    List<VignettePriceRow> vignettePriceRows = [];
    for (String vignette in vignettes) {
      vignettePriceRows.add(
        VignettePriceRow(
          getVignetteName(vignette, args.payload),
          "${getVignette(vignette, args.payload).sum.round()} Ft",
        ),
      );
    }
    return vignettePriceRows;
  }

  void calculateState() {}

  Future<void> _onConfirmationRequested(
    ConfirmationRequested event,
    Emitter<ConfirmationState> emit,
  ) async {
    emit(ConfirmationLoading());

    try {
      List<HighwayOrders> highwayOrders = [];

      for (var item in args.selectgedVignettesType) {
        HighwayVignettes highwayVignettes = getVignette(item, args.payload);
        HighwayOrders highwayOrder = HighwayOrders(
          type: item,
          category: highwayVignettes.vehicleCategory,
          cost: highwayVignettes.cost,
        );
        highwayOrders.add(highwayOrder);
      }

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

  FutureOr<void> _onLoadDatas(
    ConfirmationLoadDatasEvent event,
    Emitter<ConfirmationState> emit,
  ) {
    emit(
      ConfirmationLoaded(
        plateNumber: args.vehicleInfo.plate,
        vignetteType:
            VignetteType.getByKey(
              args.selectgedVignettesType.first,
            ).getLocalizedText(),
        vignettes: generateVignettePriceRows(args.selectgedVignettesType),
        tax: calculateTax(args.selectgedVignettesType, args.payload).toString(),
        totalPrice: calculateTotalPrice(
          args.selectgedVignettesType,
          args.payload,
          withTax: true,
        ),
        systemUsageFee: "${usageFee.round()} Ft",
      ),
    );
  }
}
