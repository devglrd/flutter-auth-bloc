import 'package:auth/bloc/bloc.dart';
import 'package:auth/router/routerConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPage extends StatefulWidget {
  AppPage({Key key}) : super(key: key);

  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        title: Text("Home Page"),
        backgroundColor: Colors.red,
      ),
      drawer: new Drawer(),
      body: Container(
          alignment: Alignment.center,
          child: Center(
            child: Text('Home Page Connected with the best'),
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
