part of 'highway_bloc.dart';

sealed class HighwayState extends Equatable {
  const HighwayState();
}

final class HighwayInitial extends HighwayState {
  @override
  List<Object> get props => [];
}
