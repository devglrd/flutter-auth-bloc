import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegisterEvent extends Equatable {
  RegisterEvent([List props = const []]) : super();
}

class OnSubmitedRegister extends RegisterEvent {
  final String email;
  final String password;
  final String first_name;
  final String last_name;

  OnSubmitedRegister(
      {@required this.email,
      @required this.password,
      @required this.first_name,
      @required this.last_name});

  @override
  // TODO: implement props
  List<Object> get props =>
      [this.email, this.password, this.first_name, this.last_name];
}

class OnError extends RegisterEvent {
  final String error;
  OnError({@required this.error}) : super([error]);

  @override
  // TODO: implement props
  List<Object> get props => [this.error];
}

class OnSuccessRegister extends RegisterEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
