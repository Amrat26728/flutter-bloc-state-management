abstract class CounterState {}

class InitialCounterState extends CounterState {}

class IncrementCounterState extends CounterState {
  final int counter;
  IncrementCounterState({required this.counter});
}

class DecrementCounterState extends CounterState {
  final int counter;
  DecrementCounterState({required this.counter});
}
