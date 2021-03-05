import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_course/constants/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit({@required this.internetCubit}) : super(CounterState(counter: 0)) {
    _monitorInternetConnection();
  }

  final InternetCubit internetCubit;
  StreamSubscription internetCubitSubscription;

  @override
  Future<void> close() {
    internetCubitSubscription.cancel();
    return super.close();
  }

  void _monitorInternetConnection() {
    internetCubitSubscription = internetCubit.listen((internetState) {
      if (internetState is InternetCennected && (internetState.connectionType == ConnectionType.Wifi || internetState.connectionType == ConnectionType.Mobile)) {
        increament();
      } else if (internetState is InternetCennected) {
        decreament();
      }
    });
  }

  void increament() => emit(CounterState(counter: state.counter + 1, wasIncremeted: true));

  void decreament() => emit(CounterState(counter: state.counter - 1, wasIncremeted: false));
}
