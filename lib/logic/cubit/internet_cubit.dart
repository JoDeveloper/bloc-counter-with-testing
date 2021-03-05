import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit({@required this.connectivity}) : super(InternetLoading()) {
    _monitorInternetState();
  }

  final Connectivity connectivity;
  StreamSubscription connectivitySubscription;

  @override
  Future<void> close() {
    connectivitySubscription.cancel();
    return super.close();
  }

  void _monitorInternetState() {
    connectivitySubscription = connectivity.onConnectivityChanged.listen((status) {
      if (status == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.Wifi);
      } else if (status == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.Mobile);
      } else if (status == ConnectivityResult.none) {
        emitInternetDisConnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType connectionType) => emit(InternetCennected(connectionType: connectionType));

  void emitInternetDisConnected() => emit(InternetDisCennected());
}
