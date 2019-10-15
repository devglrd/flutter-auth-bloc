import 'dart:async';
import 'package:auth/bloc/auth/auth_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import './bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthBloc authentificationBloc;
  RegisterBloc({@required this.authentificationBloc})
      : assert(authentificationBloc != null);
  @override
  RegisterState get initialState => InitialRegisterState();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    // TODO: Add Logic

    if (event is OnSubmited) {
      yield LoadedState();
      Map data = {
        'email': event.email.toString(),
        "password": event.password.toString(),
        "first_name": event.first_name.toString(),
        "last_name": event.last_name.toString(),
      };
      var res = await this.authentificationBloc.login(data);
      if (res.containsKey('accessToken')) {
        final storage = new FlutterSecureStorage();
        await storage.write(key: "jwt", value: res["accessToken"]);
        this.dispatch(OnSuccess());
      } else if (res.containsKey('statusCode') && res["statusCode"] != 200) {
        var mesage = "A error has been provide";
        this.dispatch(OnError(error: mesage));
      }
    }
    if (event is OnSuccess) {
      yield RegisterSucced();
    }

    if (event is OnError) {
      yield RegisterFailure(error: event.error);
    }
  }
}
