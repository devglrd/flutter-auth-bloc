import 'package:auth/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        builder: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthBloc>(context),
          );
        },
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocListener(
      listener: (context, event) {},
      bloc: loginBloc,
      child: BlocBuilder(
        bloc: loginBloc,
        builder: (context, event) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(hintText: 'password'),
                ),
                FlatButton(
                  onPressed: () {
                    loginBloc.dispatch(OnSubmited(
                        email: _emailController.text,
                        password: _passwordController.text));
                  },
                  child: Text('Se connecter'),
                ),
                event is LoadedState
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Center(),
                event is LoginSucced
                    ? Center(
                        child: Text(
                          'Login Succed ! ',
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    : Center(),
                event is LoginFailure
                    ? Center(
                        child: Text(
                          event.error,
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : Center(),
              ],
            ),
          );
        },
      ),
    );
  }
}