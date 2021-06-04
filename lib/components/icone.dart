import 'package:flutter/material.dart';

class Icone extends StatelessWidget {
  const Icone({
    Key key,
    this.img = "",
    this.press
  }) : super(key: key);
  final img;
  final Function press;
  icone(img) {
    if (img != '') {
      return GestureDetector(
        onTap: press,
        child: Flexible(
          child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(0, 191, 186, 1),
                  image: DecorationImage(
                      image: NetworkImage(img), fit: BoxFit.cover))),
        ),
      );
    } else {
      return Container(
          child: Center(
              child: Text("+8",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold))),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(0, 191, 186, 1)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return icone(img);
  }
}
