import 'package:cmedapp/components/recentes.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              UserIcon(),
              HelloUser(),
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
            ],
          )),
      ]);
  }
}

class FilterArea extends StatelessWidget {
  const FilterArea({
    Key key,
  }) : super(key: key);

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
            )],
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
      width: size.width,
      child: Column(
        children: [
          Row(
            children: [
              IconFilter(
                  icone: Icons.volunteer_activism_outlined,
                  especialidade: "Cardiologista"),
              SizedBox(width: size.width* 0.02),
              IconFilter(
                  icone: Icons.monitor_weight_outlined,
                  especialidade: "Nutricionista"),
              SizedBox(width: size.width* 0.02),
              IconFilter(
                  icone: Icons.visibility_outlined,
                  especialidade: "Oftalmologista"),
              SizedBox(width: size.width* 0.02),
              IconFilter(
                  icone: Icons.child_friendly_outlined,
                  especialidade: "Pediatra"),
            ],
          ),
          SizedBox(width: size.width* 0.02),
          Row(
            children: [
          IconFilter(
              icone: Icons.health_and_safety_outlined,
              especialidade: "Clínico Geral"),
          SizedBox(width: size.width* 0.02),
          IconFilter(
              icone: Icons.face_outlined,
              especialidade: "Dermatologista"),
          SizedBox(width: size.width* 0.02),
          IconFilter(
              icone: Icons.elderly_outlined,
              especialidade: "Geriatra"),
          SizedBox(width: size.width* 0.02),
          IconFilter(
              icone: Icons.pregnant_woman_outlined,
              especialidade: "Obstetra"),
        
            ],
          )
        ],
      ));
  }
}

class FilterTitle extends StatelessWidget {
  const FilterTitle({
    Key key,
  }) : super(key: key);

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
  const SearchBar({
    Key key,
  }) : super(key: key);

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
              onPressed: () {},
            )),
      ),
    );
  }
}

class HelloUser extends StatelessWidget {
  const HelloUser({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(
        'Olá, User!',
        style: TextStyle(
            color: Color.fromRGBO(40, 58, 67, 1),
            fontSize: 30.0,
            fontWeight: FontWeight.bold),
      )
    ]);
  }
}

class UserIcon extends StatelessWidget {
  const UserIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      IconButton(
          icon: Icon(Icons.account_circle_outlined,
              size: 30, color: Color.fromRGBO(0, 191, 181, 1)),
          onPressed: () {})
    ]);
  }
}

class IconFilter extends StatefulWidget {
  const IconFilter({Key key, this.icone, this.especialidade = ""})
      : super(key: key);

  final IconData icone;
  final String especialidade;

  @override
  _IconFilterState createState() => _IconFilterState();
}

class _IconFilterState extends State<IconFilter> {
  @override
  Widget build(BuildContext context) {
    var icone = widget.icone;
    var especialidade = widget.especialidade;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(icone, color: Color.fromRGBO(0, 191, 186, 1)),
                onPressed: () {},
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
