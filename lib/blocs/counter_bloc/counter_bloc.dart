import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_state_management/blocs/counter_bloc/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementCounterEvent>((event, emit) => emit(state + 1));
    on<DecrementCounterEvent>((event, emit) {
      if (state == 0) {
        return;
      }
      emit(state - 1);
    });
  }
}
