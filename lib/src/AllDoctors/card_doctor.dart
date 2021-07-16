import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmedapp/components/fonte.dart';
import 'package:cmedapp/src/AllDoctors/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  List lista = [];
  void getIsFavorite() async {
    StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("medicos")
          .doc(FirebaseAuth.instance.currentUser.email)
          .collection("favoritos")
          .snapshots(),
      // ignore: missing_return
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        for (var snap in snapshot.data.docs) {
          Map<dynamic, dynamic> doctors = snap.data();
          doctors.forEach((key, value) {
            if (key == "email") {
              if (lista.contains(value) == false) {
                lista.add(value);
              }
            }
          });
        }
        if (lista.contains(widget.email)) {
          isFavorite = true;
        } else {
          isFavorite = false;
        }
      },
    );
  }

  changeState() {
    setState(() {
      if (isFavorite == true) {
        Favorite(
                widget.nome, widget.sobrenome, widget.url, widget.especialidade)
            .removeFavorite(
                FirebaseAuth.instance.currentUser.email, widget.email);
        isFavorite = false;
      } else {
        Favorite(
                widget.nome, widget.sobrenome, widget.url, widget.especialidade)
            .addFavorite(FirebaseAuth.instance.currentUser.email, widget.email);
        isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                child: Image(
                  width: size.width * 0.3,
                  height: size.height,
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                  image: NetworkImage(widget.url),
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
                          widget.descricao,
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
