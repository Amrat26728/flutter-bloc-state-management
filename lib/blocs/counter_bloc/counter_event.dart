// abstract class CounterEvent {}
sealed class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}
