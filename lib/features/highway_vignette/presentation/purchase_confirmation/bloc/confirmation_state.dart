part of 'confirmation_bloc.dart';

sealed class ConfirmationState extends Equatable {
  const ConfirmationState();
}

final class ConfirmationInitial extends ConfirmationState {

  const ConfirmationInitial();

  @override
  List<Object> get props => [];
}

final class ConfirmationLoaded extends ConfirmationState {
  String plateNumber;
  String vignetteType;
  List<VignettePriceRow> vignettes;
  String tax;
  String totalPrice;
  String systemUsageFee;

  ConfirmationLoaded({
    required this.plateNumber,
    required this.vignetteType,
    required this.vignettes,
    required this.tax,
    required this.totalPrice,
    required this.systemUsageFee,
  });

  @override
  List<Object> get props => [];
}
