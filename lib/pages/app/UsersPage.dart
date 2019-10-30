import 'dart:convert';

import 'package:auth/model/Users.dart';
import 'package:auth/service/UserService.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  UsersPage({Key key}) : super(key: key);

  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final UserService userService = UserService();
  List usersList;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var users = await this.userService.index();

    var list = users['data'] as List;

    usersList = list.map((i) => User.fromJson(i)).toList();

    setState(() {});
  }

  void dipose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (usersList == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,

            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  alignment: Alignment.center,
                  color: Colors.grey,
                  child: Text('${this.usersList[index].email}'),
                );
              },
              childCount: this.usersList.length,
            ),
          ),
        ],
      );
    }
  }
}
