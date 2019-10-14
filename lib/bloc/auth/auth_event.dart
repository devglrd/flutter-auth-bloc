import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AppStarted extends AuthEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoggedIn extends AuthEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LogggedOut extends AuthEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
