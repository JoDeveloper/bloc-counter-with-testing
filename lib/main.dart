import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/counter_cubit.dart';
import 'logic/cubit/internet_cubit.dart';
import 'presntation/routes/app_router.dart';

void main() {
  runApp(
    MyApp(
      connectivity: Connectivity(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  const MyApp({Key key, this.connectivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider(
          create: (context) => CounterCubit(
            internetCubit: context.read<InternetCubit>(),
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
