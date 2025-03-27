import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'highway_event.dart';
part 'highway_state.dart';

class HighwayBloc extends Bloc<HighwayEvent, HighwayState> {
  HighwayBloc() : super(HighwayInitial()) {
    on<HighwayEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
