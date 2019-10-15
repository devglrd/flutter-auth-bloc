import 'package:auth/pages/app/AppPage.dart';
import 'package:auth/pages/public/PublicPage.dart';
import 'package:auth/router/routerConstant.dart';
import 'package:auth/service/AuthService.dart';
import 'package:auth/widget/common/LoadingIndicator.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'bloc/auth/auth_bloc.dart';
import 'bloc/bloc.dart';
import 'package:auth/router/router.dart' as router;

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

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      BlocProvider.of<AuthBloc>(context)..dispatch(AppStarted());
    }
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
        child: MaterialApp(
            title: "Auth App",
            initialRoute: HomeViewRoute,
            onGenerateRoute: router.generateRoute,
            home: BlocListener(
              listener: (context, event) {
                if (event is AuthAuthenticated) {
                  return Navigator.pushNamed(context, AppViewRoute);
                } else if (event is AuthNotAuthenticated) {
                  return Navigator.pushNamed(context, HomeViewRoute);
                }
              },
              bloc: BlocProvider.of<AuthBloc>(context),
              child: BlocBuilder<AuthBloc, AuthState>(
                bloc: BlocProvider.of<AuthBloc>(context),
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return LoadingIndicator();
                  } else if (state is AuthNotAuthenticated) {
                    return PublicPage();
                  }
                  return Center();
                },
              ),
            )));
  }
}
