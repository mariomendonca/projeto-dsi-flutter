import 'package:flutter/material.dart';

class TextAndFilter extends StatefulWidget {
  const TextAndFilter({
    Key key,
  }) : super(key: key);

  @override
  _TextAndFilterState createState() => _TextAndFilterState();
}

class _TextAndFilterState extends State<TextAndFilter> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Doutores",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TextButton(
              onPressed: () {},
              child: Text(
                "Filtros",
                style: TextStyle(color: Color(0xff00BFBA)),
              ))
        ],
      ),
    );
  }
}
