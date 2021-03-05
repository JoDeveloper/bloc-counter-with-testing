import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetLoading());

  void emitInternetConnected(ConnectionType connectionType) => emit(InternetCennected(connectionType: connectionType));
  void emitInternetDisConnected(ConnectionType connectionType) => emit(InternetDisCennected());
}
