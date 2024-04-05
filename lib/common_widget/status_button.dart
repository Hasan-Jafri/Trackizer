import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';

class StatusButton extends StatelessWidget {
  final String title;
  final String value;
  final Color statuscolor;
  final VoidCallback? onpressed;
  const StatusButton(
      {super.key,
      required this.title,
      required this.value,
      required this.statuscolor,
      this.onpressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Stack(alignment: Alignment.topCenter, children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(color: Tcolor.border.withOpacity(0.15)),
              color: Tcolor.grey60.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12)),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Tcolor.grey40,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                value,
                style: TextStyle(
                    color: Tcolor.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Container(
          width: 60,
          height: 1,
          color: statuscolor,
        ),
      ]),
    );
  }
}
