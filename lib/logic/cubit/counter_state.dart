part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  final bool wasIncremeted;
  CounterState({@required this.counter, this.wasIncremeted});

  @override
  List<Object> get props => [counter, wasIncremeted];
}
