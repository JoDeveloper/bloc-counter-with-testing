import 'package:bloc_course/logic/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });

    //1-
    test(
      "the initial state for counterCubit is counterState(counter:0)",
      () {
        expect(counterCubit.state, CounterState(counter: 0));
      },
    );

    blocTest(
      'the cubit should emit CounterState(counter:1,wasIncremented:true) when increment method was called .',
      build: () => counterCubit,
      act: (cubit) => cubit.increament(),
      expect: [CounterState(counter: 1, wasIncremeted: true)],
    );
    blocTest(
      'the cubit should emit CounterState(counter:0,wasIncremented:false) when decrement method was called .',
      build: () => counterCubit,
      act: (cubit) => cubit.decreament(),
      expect: [CounterState(counter: -1, wasIncremeted: false)],
    );

    //tearDown

    tearDown(() {
      counterCubit.close();
    });
  });
}
