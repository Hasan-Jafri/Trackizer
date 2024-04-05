// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';

class RoundedTextField extends StatelessWidget {
  final String title;
  final double fontsize;
  final TextAlign titleAlign;
  final TextEditingController controller;
  final TextInputType? inputType;
  final bool obscureText;

  const RoundedTextField(
      {super.key,
      required this.title,
      this.fontsize = 12,
      required this.controller,
      required this.inputType,
      this.obscureText = false,
      this.titleAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                textAlign: titleAlign,
                style: TextStyle(color: Tcolor.grey50, fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 48,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Tcolor.grey60.withOpacity(0.05),
              border: Border.all(color: Tcolor.grey70),
              borderRadius: BorderRadius.circular(15)),
          child: TextField(
            keyboardType: inputType,
            controller: controller,
            style: TextStyle(color: Tcolor.white),
            decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
