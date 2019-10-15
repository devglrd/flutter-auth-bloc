import 'dart:async';
import 'package:auth/bloc/auth/auth_bloc.dart';
import 'package:auth/bloc/auth/auth_event.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:overlay_support/overlay_support.dart';
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

    if (event is OnSubmitedRegister) {
      yield LoadedStateRegister();
      Map data = {
        'email': event.email.toString(),
        "password": event.password.toString(),
        "firstName": event.first_name.toString(),
        "lastName": event.last_name.toString(),
      };
      var res = await this.authentificationBloc.register(data);
      print(res);
      if (res.containsKey('accessToken')) {
        final storage = new FlutterSecureStorage();
        await storage.write(key: "jwt", value: res["accessToken"]);
        this.dispatch(OnSuccessRegister());
      } else if (res.containsKey('statusCode') && res["statusCode"] != 200) {
        var mesage = "A error has been provide";
        this.dispatch(OnError(error: mesage));
      }
    }
    if (event is OnSuccessRegister) {
      this.authentificationBloc.dispatch(LoggedIn());


      yield RegisterSucced();
    }

    if (event is OnError) {
      yield RegisterFailure(error: event.error);
    }
  }
}
