import 'package:cmedapp/src/FiltroScreen/widgets/label_text.dart';
import 'package:cmedapp/src/FiltroScreen/widgets/scroll_especialidades.dart';
import 'package:cmedapp/src/Home/view.dart';

import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Color.fromRGBO(0, 191, 186, 1),
                        )),
                    UserIcon(),
                  ],
                ),
              ),
            ),
            LabelText(),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * 0.8,
              height: size.height * 0.7,
              child: ScrollEspecialidades(),
            ),
          ],
        ),
      ),
    );
  }
}

class Espaco extends StatelessWidget {
  const Espaco({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.01,
      width: size.width * 0.01,
    );
  }
}
