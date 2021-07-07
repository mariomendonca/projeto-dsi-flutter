import 'package:cmedapp/src/PerfilUser/Body.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
            icon: Icon(Icons.logout),
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (context) => new AlertDialog(
                        title: Text("Encerrar sua sessão"),
                        content: Text(
                            "Voce tem certeza que deseja encerrar sua sessão?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/homePage',
                                    (Route<dynamic> route) => false);
                              },
                              child: Text("Sair")),
                          /////////////////////////////////////////////////
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancelar"))
                        ],
                      ));
            },
            color: Color.fromRGBO(0, 191, 186, 1),
          ),
        ],
      ),
      body: BodyUser(),
    );
  }
}
