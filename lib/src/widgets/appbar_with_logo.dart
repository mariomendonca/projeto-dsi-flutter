import 'package:cmedapp/src/widgets/logo.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      padding: EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Logo()],
      ),
    );
  }
}
