// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextInField extends StatelessWidget {
  String text;
  double size;
  double top;
  TextInField(
      {required this.text, super.key, required this.size, required this.top});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, bottom: 16),
      child: Text(text,
          style: TextStyle(
            fontSize: size,
            fontWeight: FontWeight.w700,
            fontFamily: 'ProximaNovaA',
          )),
    );
  }
}
