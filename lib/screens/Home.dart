import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: IconButton(
                          icon: Icon(Icons.account_circle_outlined,
                              size: 30, color: Color.fromRGBO(0, 191, 181, 1)),
                          onPressed: () {}))
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    'Olá, User!',
                    style: TextStyle(
                        color: Color.fromRGBO(40, 58, 67, 1),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  )
                ]),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: TextFormField(
                    autofocus: false,
                    style: TextStyle(color: Colors.tealAccent[700]),
                    decoration: InputDecoration(

                        prefixIcon:IconButton(icon: 
                        Icon(Icons.search_outlined,
                            color: Color.fromRGBO(0, 191, 181, 1),    
                            ),
                        padding: EdgeInsets.only(left: 20,right: 10),
                        onPressed: (){}),
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
                          onPressed: (){},
                        )),
                  ),
                )
              ],
            )));
  }
}
