import 'package:flutter/material.dart';

class progress_indicator extends StatelessWidget {
  progress_indicator({
    required this.colorText,
    required this.value,
  });

  Color colorText;
  double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: 300,
      height: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: LinearProgressIndicator(
          value: value,
          valueColor: AlwaysStoppedAnimation<Color>(colorText),
          backgroundColor: Color(0xffD6D6D6),
        ),
      ),
    );
  }
}
