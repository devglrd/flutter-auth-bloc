import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super();
}

class OnSubmited extends LoginEvent {
  final String email;
  final String password;

  OnSubmited({@required this.email, @required this.password});

  @override
  // TODO: implement props
  List<Object> get props => [this.email, this.password];
}

class OnError extends LoginEvent {
  final String error;
  OnError({@required this.error}) : super([error]);

  @override
  // TODO: implement props
  List<Object> get props => [this.error];
}

class OnSuccess extends LoginEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
