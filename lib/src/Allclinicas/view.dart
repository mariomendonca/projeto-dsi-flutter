import 'package:cmedapp/src/Allclinicas/widgets/scroll_clinicas.dart';

import 'package:flutter/material.dart';

class AllClinica extends StatefulWidget {
  const AllClinica({key}) : super(key: key);

  @override
  _AllClinicaState createState() => _AllClinicaState();
}

class _AllClinicaState extends State<AllClinica> {
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
            ScrollClinica()
          ],
        ),
      ),
    );
  }
}
