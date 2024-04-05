import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onpressed;
  final double fontSize;
  final FontWeight fontWeight;

  const PrimaryButton(
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
              image: AssetImage("assets/img/primary_btn.png"),
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Tcolor.secondary.withOpacity(0.3),
                  blurRadius: 5,
                  offset: const Offset(0, 4)),
            ]),
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
