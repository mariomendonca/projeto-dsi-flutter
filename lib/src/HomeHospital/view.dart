import 'package:cmedapp/src/AllDoctors/widgets/scroll_doctor.dart';
import 'package:cmedapp/src/AllDoctors/widgets/text_and_filter.dart';
import 'package:cmedapp/src/HomeHospital/widgets/scroll_hosp.dart';
import 'package:cmedapp/src/PerfilMed/view.dart';
import 'package:cmedapp/src/widgets/recentes.dart';

import 'package:flutter/material.dart';

class AllHosp extends StatefulWidget {
  final String especialidade;
  final String nome;
  final bool isEspecialidade;

  const AllHosp({key, this.especialidade, this.isEspecialidade, this.nome})
      : super(key: key);

  @override
  _AllHospState createState() => _AllHospState();
}

class _AllHospState extends State<AllHosp> {
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
          // IconButton(
          //   icon: Icon(
          //     Icons.account_circle_outlined,
          //   ),
          //   color: Color(0xff00BFBA),
          //   onPressed: () {
          //     Navigator.of(context)
          //         .push(MaterialPageRoute(builder: (context) => PerfilMed()));
          //   },
          // )
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
            // Container(
            //   width: size.width * 0.8,
            //   child: Text(
            //     "Recentes",
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   ),
            // ),
            // Container(
            //   width: size.width * 0.8,
            //   child: Recentes(),
            // ),
            // TextAndFilter(),
            // ScrollDoctors(
            //     especialidade: widget.especialidade,
            //     nome: widget.nome,
            //     isEspecialidade: widget.isEspecialidade)
            ScrollHosp()
          ],
        ),
      ),
    );
  }
}
