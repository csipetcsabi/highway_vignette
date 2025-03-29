part of 'confirmation_bloc.dart';

sealed class ConfirmationState extends Equatable {
  const ConfirmationState();
}

final class ConfirmationInitial extends ConfirmationState {

  const ConfirmationInitial();

  @override
  List<Object> get props => [];
}

final class ConfirmationSuccess extends ConfirmationState {

  const ConfirmationSuccess();

  @override
  List<Object> get props => [];
}

class ConfirmationLoaded extends ConfirmationState {
  final String plateNumber;
  final String vignetteType;
  final List<VignettePriceRow> vignettes;
  final String tax;
  final String totalPrice;
  final String systemUsageFee;

  const ConfirmationLoaded({
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
