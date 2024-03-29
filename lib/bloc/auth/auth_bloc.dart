import 'dart:async';
import 'dart:math';
import 'package:auth/bloc/bloc.dart';
import 'package:auth/service/AuthService.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:overlay_support/overlay_support.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authSerivce;

  AuthBloc(this.authSerivce);

  @override
  AuthState get initialState => AuthUninitialized();

  login(data) async {
    return await this.authSerivce.login(data);
  }

  register(data) async {
    return await this.authSerivce.register(data);
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    // TODO: Add Logic
    if (event is AppStarted) {
      // NEED TO KNOW IF USER IS CONNECTED OR NOT
      yield AuthLoading();
      var isLogin = await this.authSerivce.auth();
      print(isLogin);
      if (isLogin == false) {
        this.dispatch(LogggedOut());
      } else if (isLogin.containsKey('id')) {
        this.dispatch(LoggedIn());
      }
    } else if (event is LoggedIn) {
      yield AuthLoading();
      final storage = new FlutterSecureStorage();
      var key = await storage.read(key: "jwt");
      if (key != null) {
        toast('You\'r logged in ! ');
        yield AuthAuthenticated();
      } else {
        this.dispatch(LogggedOut());
      }
    } else if (event is LogggedOut) {
      yield AuthLoading();
      final storage = new FlutterSecureStorage();
      await storage.delete(key: "jwt");
      toast('You\'r logged out ! ');
      yield AuthNotAuthenticated();
    }
  }
}
