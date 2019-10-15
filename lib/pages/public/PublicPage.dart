import 'package:flutter/material.dart';
import 'package:auth/router/routerConstant.dart';

class PublicPage extends StatelessWidget {
  const PublicPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return Container();
          },
        ),
        title: Text("My Auth"),
      ),
      body: Container(
        alignment: Alignment(0.0, 0.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginViewRoute);
                },
                child: Text("Connexion"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegisterViewRoute);
                },
                child: Text("Inscription"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
