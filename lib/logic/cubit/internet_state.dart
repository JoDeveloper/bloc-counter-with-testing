part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetLoading extends InternetState {}

class InternetCennected extends InternetState {
  final ConnectionType connectionType;

  InternetCennected({@required this.connectionType});
}

class InternetDisCennected extends InternetState {}
