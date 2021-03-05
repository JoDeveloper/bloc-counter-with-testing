import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listenWhen: (_, state) => state.wasIncremeted,
              listener: (context, state) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Incremeted!'),
                  duration: const Duration(milliseconds: 300),
                ));
              },
              builder: (context, state) {
                return Text(
                  state.counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/third'),
              child: Text('go to third Screen'),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'second-encremnet',
            onPressed: () => context.read<CounterCubit>().increament(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'second-decremnet',
            onPressed: () => context.read<CounterCubit>().decreament(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
