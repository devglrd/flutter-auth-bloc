import 'package:auth/bloc/bloc.dart';
import 'package:auth/bloc/register/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Regsiter"),
      ),
      body: BlocProvider(
        builder: (content) {
          return RegisterBloc(
              authentificationBloc: BlocProvider.of<AuthBloc>(context));
        },
        child: RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  RegisterForm({Key key}) : super(key: key);

  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return BlocListener(
        listener: (context, event) {},
        bloc: BlocProvider.of<RegisterBloc>(context),
        child: BlocBuilder(
          bloc: BlocProvider.of<RegisterBloc>(context),
          builder: (context, event) {
            print(event.runtimeType);
            return Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextField(decoration: InputDecoration(hintText: "Email")),
                    TextField(
                        decoration: InputDecoration(hintText: "First Name")),
                    TextField(
                        decoration: InputDecoration(hintText: "Last Name")),
                    TextField(
                      decoration: InputDecoration(hintText: "password"),
                      obscureText: true,
                    ),
                    MaterialButton(
                      
                      child: Text('Register'),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
