import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginState extends Equatable {
  const LoginState([List<String> list]);
}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoadedState extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoginSucced extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({@required this.error});

  @override
  String toString() => 'LoginFailure { error: $error }';

  @override
  // TODO: implement props
  List<Object> get props => [this.error];
}
