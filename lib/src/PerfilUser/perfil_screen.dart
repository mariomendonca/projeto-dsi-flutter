import 'package:cmedapp/src/PerfilUser/Body.dart';
import 'package:flutter/material.dart';

class PerfilUser extends StatefulWidget {
  @override
  _PerfilUserState createState() => _PerfilUserState();
}

class _PerfilUserState extends State<PerfilUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Color.fromRGBO(0, 191, 186, 1),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit_outlined),
            onPressed: () {},
            color: Color.fromRGBO(0, 191, 186, 1),
          ),
        ],
      ),
      body: BodyUser(),
    );
  }
}
