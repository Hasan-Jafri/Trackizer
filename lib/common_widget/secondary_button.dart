import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onpressed;
  final double fontSize;
  final FontWeight fontWeight;

  const SecondaryButton(
      {super.key,
      required this.title,
      required this.onpressed,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/img/secodry_btn.png"),
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: fontSize, color: Tcolor.white, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
