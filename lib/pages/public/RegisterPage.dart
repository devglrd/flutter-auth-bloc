import 'package:auth/bloc/bloc.dart';
import 'package:auth/bloc/bloc.dart' as prefix1;
import 'package:auth/bloc/register/bloc.dart';
import 'package:auth/bloc/register/bloc.dart' as prefix0;
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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final RegisterBloc registerBloc = BlocProvider.of<RegisterBloc>(context);
    return BlocListener(
        listener: (context, event) {},
        bloc: registerBloc,
        child: BlocBuilder(
          bloc: registerBloc,
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
                    TextField(
                        controller: _emailController,
                        decoration: InputDecoration(hintText: "Email")),
                    TextField(
                        controller: _firstNameController,
                        decoration: InputDecoration(hintText: "First Name")),
                    TextField(
                        controller: _lastNameController,
                        decoration: InputDecoration(hintText: "Last Name")),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(hintText: "password"),
                      obscureText: true,
                    ),
                    MaterialButton(
                      child: Text('Register'),
                      onPressed: () {
                        registerBloc.dispatch(OnSubmitedRegister(
                            email: _emailController.text,
                            first_name: _firstNameController.text,
                            last_name: _lastNameController.text,
                            password: _passwordController.text));
                      },
                    ),
                    event is LoadedStateRegister
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Center(),
                    event is RegisterFailure
                        ? Center(
                            child: Text(
                              "A error has been encoured",
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        : Center()
                  ],
                ),
              ),
            );
          },
        ));
  }
}
