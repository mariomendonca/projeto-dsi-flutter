import 'package:cmedapp/components/recentes.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        ));
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
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  'O que você precisa?',
                  style: TextStyle(
                      color: Color.fromRGBO(40, 58, 67, 1),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                IconFilter( icone: Icons.volunteer_activism_outlined , especialidade: "Cardiologista"),
                IconFilter( icone: Icons.volunteer_activism_outlined , especialidade: "Cardiologista"),IconFilter( icone: Icons.volunteer_activism_outlined , especialidade: "Cardiologista"),
              ],
            )
          ],

        ));
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
  const IconFilter({
    Key key,
    this.icone,
    this.especialidade = ""
  }) : super(key: key);

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
                  fontSize: 10,
                ),
              )
            ],
          )
        ],
      ),
      width: 75,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
