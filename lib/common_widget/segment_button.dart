import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';

class SegmentButton extends StatelessWidget {
  final String title;
  final VoidCallback? onpressed;
  final bool isActive;
  const SegmentButton(
      {super.key,
      required this.title,
      required this.onpressed,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                border: Border.all(color: Tcolor.border.withOpacity(0.15)),
                color: Tcolor.grey60.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12))
            : null,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              color: isActive ? Tcolor.white : Tcolor.grey30,
              fontSize: 12,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
