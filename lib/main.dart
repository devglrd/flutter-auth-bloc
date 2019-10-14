import 'package:auth/pages/HomePage.dart';
import 'package:auth/pages/LoginPage.dart';
import 'package:auth/service/AuthService.dart';
import 'package:auth/widget/common/LoadingIndicator.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth/auth_bloc.dart';
import 'bloc/bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  var authService = AuthService();
  runApp(
    BlocProvider<AuthBloc>(
      builder: (context) {
        return AuthBloc(authService)..dispatch(AppStarted());
      },
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthBloc, AuthState>(
        bloc: BlocProvider.of<AuthBloc>(context),
        builder: (context, state) {
          if (state is AuthLoading) {
            return LoadingIndicator();
          } else if (state is AuthNotAuthenticated) {
            return LoginPage();
          } else if (state is AuthAuthenticated) {
            return HomePage();
          }
          return Center();
        },
      ),
    );
  }
}
