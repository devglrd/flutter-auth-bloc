import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthUninitialized extends AuthState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AuthUninitialized';
}

class AuthLoading extends AuthState {
  @override
  // TODO: implement props
  List<Object> get props => null;

  @override
  String toString() => 'AuthLoading';
}

class AuthAuthenticated extends AuthState {
  @override
  // TODO: implement props
  List<Object> get props => null;

  @override
  String toString() => 'AuthAuthenticated';
}

class AuthNotAuthenticated extends AuthState {
  @override
  // TODO: implement props
  List<Object> get props => null;

  @override
  String toString() => 'AuthNotAuthenticated';
}
