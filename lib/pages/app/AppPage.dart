import 'package:auth/bloc/bloc.dart';
import 'package:auth/pages/app/PicturePage.dart';
import 'package:auth/pages/app/SettingPage.dart';
import 'package:auth/pages/app/UsersPage.dart';
import 'package:auth/router/routerConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPage extends StatefulWidget {
  AppPage({Key key}) : super(key: key);

  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int _selectedTab = 0;
  final _pageOptions = [
    UsersPage(),
    PicturePage(),
    SettingPage(),
  ];
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
      body: _pageOptions[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Container(),
            title: Text('Users'),
          ),
          BottomNavigationBarItem(
            icon: Container(),
            title: Text('Capture'),
          ),
          BottomNavigationBarItem(
            icon: Container(),
            title: Text('Setting'),
          ),
        ],
        onTap: (int index) {
          setState(() {
            _selectedTab = index;
          });
        },
        currentIndex: _selectedTab,
      ),
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
