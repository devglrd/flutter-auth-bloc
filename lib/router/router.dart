import 'package:auth/pages/app/AppPage.dart';
import 'package:auth/pages/public/LoginPage.dart';

import 'package:auth/pages/public/RegisterPage.dart';
import 'package:auth/router/routerConstant.dart';
import 'package:auth/widget/common/undefined.dart';
import 'package:flutter/material.dart';

import '../main.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var arguments = settings.arguments;
  switch (settings.name) {
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => App());
    case LoginViewRoute:
      return MaterialPageRoute(
          builder: (context) => LoginPage());
    case RegisterViewRoute:
      return MaterialPageRoute(builder: (context) => RegisterPage());
    case AppViewRoute:
      return MaterialPageRoute(
          builder: (context) => AppPage());
    default:
      return MaterialPageRoute(
          builder: (context) => UndefinedView(name: settings.name));
  }
}
