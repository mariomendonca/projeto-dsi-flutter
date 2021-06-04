import 'package:cmedapp/components/recentes.dart';

import 'package:cmedapp/screens/AllDoctors/scroll_doctor.dart';
import 'package:cmedapp/screens/AllDoctors/text_and_filter.dart';
import 'package:cmedapp/screens/PerfilMed/perfil_med.dart';
import 'package:flutter/material.dart';

class AllDoctors extends StatefulWidget {
  const AllDoctors({key}) : super(key: key);

  @override
  _AllDoctorsState createState() => _AllDoctorsState();
}

class _AllDoctorsState extends State<AllDoctors> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          color: Color(0xff00BFBA),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            color: Color(0xff00BFBA),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PerfilMed()));
            },
          )
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: size.width * 0.8,
              child: Text(
                "Recentes",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: size.width * 0.8,
              child: Recentes(),
            ),
            TextAndFilter(),
            ScrollDoctors()
          ],
        ),
      ),
    );
  }
}
