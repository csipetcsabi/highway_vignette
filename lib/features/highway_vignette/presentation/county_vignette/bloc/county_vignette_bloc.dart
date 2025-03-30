import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/args/county_page_args.dart';

part 'county_vignette_event.dart';
part 'county_vignette_state.dart';

class CountyVignetteBloc extends Bloc<CountyVignetteEvent, CountyVignetteState> {
  CountyPageArgs args;

  CountyVignetteBloc(this.args) : super(CountyVignetteInitial()) {
    on<CountyVignetteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
