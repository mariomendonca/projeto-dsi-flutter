import 'package:cmedapp/components/recentes.dart';
import 'package:cmedapp/firestore_model.dart';
import 'package:flutter/material.dart';
import 'package:cmedapp/globals.dart' as globals;

class BodyUser extends StatefulWidget {
  @override
  _BodyUserState createState() => _BodyUserState();
}

class _BodyUserState extends State<BodyUser> {
  @override
  Widget build(BuildContext context) {
    var nome = globals.nome;

    var sobrenome = globals.user["sobrenome"];
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListView(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    '$nome $sobrenome',
                    style: TextStyle(
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(40, 58, 67, 1)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    width: size.width * 0.8,
                    height: 2,
                    color: Color.fromRGBO(242, 240, 240, 1),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Recentes',
                          style: TextStyle(
                              color: Color.fromRGBO(40, 58, 67, 1),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Recentes(),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Consultas Marcadas',
                            style: TextStyle(
                                color: Color.fromRGBO(40, 58, 67, 1),
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  child: Text('3 consultas'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      Consulta(),
                      SizedBox(height: size.height * 0.02),
                      Consulta(),
                      SizedBox(height: size.height * 0.02),
                      Consulta(),
                      SizedBox(height: size.height * 0.02),
                      Consulta()
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Consulta extends StatelessWidget {
  const Consulta({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color.fromRGBO(237, 243, 247, 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: (size.width * 0.8) - 120,
            child: (Text('Doutor Adrian',
                style: TextStyle(
                    color: Color.fromRGBO(0, 191, 186, 1),
                    fontWeight: FontWeight.bold))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: size.width * 0.2,
                  child: (Text('Qui',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 191, 186, 1),
                          fontWeight: FontWeight.bold)))),
              Container(
                width: size.width * 0.2,
                child: (Text('18h às 19h',
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(0, 191, 186, 1),
                        fontWeight: FontWeight.bold))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
