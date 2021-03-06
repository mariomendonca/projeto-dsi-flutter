import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cmedapp/src/AllDoctors/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strings/strings.dart';

class CardDoctor extends StatefulWidget {
  const CardDoctor(
      {Key key,
      this.nome,
      this.sobrenome,
      this.especialidade,
      this.url,
      this.descricao,
      this.press,
      this.email})
      : super(key: key);
  final String nome;
  final String sobrenome;
  final String especialidade;
  final String url;
  final String descricao;
  final Function press;
  final String email;

  @override
  _CardDoctorState createState() => _CardDoctorState();
}

class _CardDoctorState extends State<CardDoctor> {
  bool isFavorite;
  List<String> lista = [];

  bool IsFavorite(List lista, email) {
    bool _isFavorite;
    if (lista.contains(email)) {
      _isFavorite = true;
    } else {
      _isFavorite = false;
    }
    return _isFavorite;
  }

  changeState() {
    setState(() {
      if (isFavorite == true) {
        Favorite(widget.nome, widget.sobrenome, widget.url,
                widget.especialidade, widget.email)
            .removeFavorite(
                FirebaseAuth.instance.currentUser.email, widget.email);
        isFavorite = false;
        lista.remove(widget.email);
      } else {
        Favorite(widget.nome, widget.sobrenome, widget.url,
                widget.especialidade, widget.email)
            .addFavorite(FirebaseAuth.instance.currentUser.email, widget.email);
        isFavorite = true;
        lista.add(widget.email);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection("pacientes")
        .doc(FirebaseAuth.instance.currentUser.email)
        .collection("favoritos")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> doctor = doc.data();
        doctor.forEach((key, value) {
          if (key == "email" && lista.contains(value.toString()) != true) {
            setState(() {
              lista.add(value.toString());
            });
          }
        });
      });
    });
    isFavorite = IsFavorite(lista, widget.email);
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.press,
      child: Stack(children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: size.height * 0.2,
          width: size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffE5F6FE)),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.network(
                    widget.url,
                    fit: BoxFit.fill,
                    width: size.width * 0.3,
                    height: size.height,
                  ),
                ),
              ),
              Container(
                width: size.width * 0.5,
                height: size.height,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Dr. ${widget.nome} ${widget.sobrenome}",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                        minFontSize: 12,
                      ),
                      SizedBox(
                        height: size.height * 0.002,
                      ),
                      AutoSizeText(
                        widget.especialidade.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.black,
                        ),
                        minFontSize: 8,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Flexible(
                        child: AutoSizeText(
                          capitalize(widget.descricao),
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 11.0,
                              color: Color(0xff94999C),
                              fontWeight: FontWeight.w500),
                          minFontSize: 10,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            right: 1,
            top: 2,
            child: IconButton(
                onPressed: changeState,
                // icon
                icon: isFavorite == true
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 22,
                      )
                    : Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.red,
                        size: 22,
                      ))),
      ]),
    );
  }
}
