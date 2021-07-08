import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmedapp/components/recentes.dart';
import 'package:cmedapp/firestore_model.dart';
import 'package:cmedapp/src/AllDoctors/all_doctors.dart';
import 'package:cmedapp/src/FiltroScreen/filter_screen.dart';
import 'package:cmedapp/src/PerfilUser/perfil_screen.dart';

import 'package:cmedapp/globals.dart' as globals;
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'dashboard.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    CollectionReference user =
        FirebaseFirestore.instance.collection('pacientes');
    addUserToLocalStorage();
    return FutureBuilder(
        future: user.doc(FirebaseAuth.instance.currentUser.email).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(18),
              child: ListView(children: [
                UserIcon(),
                HelloUser(snapshot.data['nome']),
                SearchBar(),
                Padding(padding: EdgeInsets.only(top: 15), child: Dashboard()),
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
                FilterArea(),
              ]),
            );
          }
        });
  }
}

class FilterArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            FilterTitle(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: FilterIcons(),
            )
          ],
        ));
  }
}

class FilterIcons extends StatelessWidget {
  const FilterIcons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.8,
        child: Column(
          children: [
            Row(
              children: [
                IconFilter(
                    icone: Icons.volunteer_activism,
                    especialidade: "Cardiologista",
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AllDoctors()));
                    }),
                SizedBox(width: size.width * 0.02),
                IconFilter(
                    icone: Icons.face_outlined,
                    especialidade: "Nutricionista",
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AllDoctors()));
                    }),
                SizedBox(width: size.width * 0.02),
                IconFilter(
                    icone: Icons.visibility_outlined,
                    especialidade: "Oftalmologista",
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AllDoctors()));
                    }),
                SizedBox(width: size.width * 0.02),
                IconFilter(
                    icone: Icons.child_friendly_outlined,
                    especialidade: "Pediatra",
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AllDoctors()));
                    }),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              children: [
                IconFilter(
                    icone: Icons.face_outlined,
                    especialidade: "Clínico Geral",
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AllDoctors()));
                    }),
                SizedBox(width: size.width * 0.02),
                IconFilter(
                    icone: Icons.face_outlined,
                    especialidade: "Dermatologista",
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AllDoctors()));
                    }),
                SizedBox(width: size.width * 0.02),
                IconFilter(
                    icone: Icons.elderly_outlined,
                    especialidade: "Geriatra",
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AllDoctors()));
                    }),
                SizedBox(width: size.width * 0.02),
                IconFilter(
                    icone: Icons.pregnant_woman_outlined,
                    especialidade: "Obstetra",
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AllDoctors()));
                    }),
              ],
            )
          ],
        ));
  }
}

class FilterTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            'O que você precisa?',
            style: TextStyle(
                color: Color.fromRGBO(40, 58, 67, 1),
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        autofocus: false,
        style: TextStyle(color: Colors.tealAccent[700]),
        decoration: InputDecoration(
            prefixIcon: IconButton(
                icon: Icon(
                  Icons.search_outlined,
                  color: Color.fromRGBO(0, 191, 181, 1),
                ),
                padding: EdgeInsets.only(left: 20, right: 10),
                onPressed: () {}),
            filled: true,
            fillColor: Color.fromRGBO(229, 246, 254, 1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            hintText: "Pesquisar",
            suffixIcon: IconButton(
              icon: Icon(
                Icons.filter_list_outlined,
              ),
              padding: EdgeInsets.only(right: 20),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FilterScreen()));
              },
            )),
      ),
    );
  }
}

class HelloUser extends StatefulWidget {
  final nome;
  HelloUser(this.nome);

  @override
  _HelloUserState createState() => _HelloUserState();
}

class _HelloUserState extends State<HelloUser> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text('Olá, ${globals.nome}!',
          style: TextStyle(
            color: Color.fromRGBO(40, 58, 67, 1),
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ))
    ]);
  }
}

class UserIcon extends StatelessWidget {
  const UserIcon({
    Key key,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      IconButton(
          icon: Icon(Icons.account_circle_outlined,
              size: 30, color: Color.fromRGBO(0, 191, 181, 1)),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => PerfilUser()));
          })
    ]);
  }
}

class IconFilter extends StatefulWidget {
  const IconFilter({Key key, this.icone, this.especialidade = "", this.press})
      : super(key: key);

  final IconData icone;
  final String especialidade;
  final Function press;

  @override
  _IconFilterState createState() => _IconFilterState();
}

class _IconFilterState extends State<IconFilter> {
  @override
  Widget build(BuildContext context) {
    var icone = widget.icone;
    var especialidade = widget.especialidade;
    var press = widget.press;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(icone, color: Color.fromRGBO(0, 191, 186, 1)),
                onPressed: press,
                iconSize: 25,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                especialidade,
                style: TextStyle(
                  color: Color.fromRGBO(0, 191, 186, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 9,
                ),
              )
            ],
          )
        ],
      ),
      width: 75,
      height: 60,
      decoration: BoxDecoration(
          color: Color.fromRGBO(237, 243, 247, 1),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
