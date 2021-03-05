import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0));

  void increament() => emit(CounterState(counter: state.counter + 1, wasIncremeted: true));

  void decreament() => emit(CounterState(counter: state.counter - 1, wasIncremeted: false));
}
