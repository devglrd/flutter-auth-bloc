import 'package:auth/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page Connected"),
      ),
      body: Container(
          alignment: Alignment.center,
          child: Center(
            child: Text('Home Page Connected'),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          BlocProvider.of<AuthBloc>(context).dispatch(LogggedOut());
        },
        child: Icon(Icons.power_settings_new),
        backgroundColor: Colors.green,
      ),
    );
  }
}
