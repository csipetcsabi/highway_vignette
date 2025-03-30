part of 'confirmation_bloc.dart';

sealed class ConfirmationEvent {
  const ConfirmationEvent();
}

class ConfirmationRequested extends ConfirmationEvent {}

class ConfirmationLoadDatasEvent extends ConfirmationEvent {}
