import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegisterState extends Equatable {
  RegisterState([List props = const []]) : super();
}

class InitialRegisterState extends RegisterState {
  @override
  List<Object> get props => [];
}

class LoadedState extends RegisterState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RegisterSucced extends RegisterState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure({@required this.error});

  @override
  String toString() => 'RegisterFailure { error: $error }';

  @override
  // TODO: implement props
  List<Object> get props => [this.error];
}
