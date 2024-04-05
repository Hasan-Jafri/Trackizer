import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';

class ImageButton extends StatelessWidget {
  final String image;
  final VoidCallback? onpressed;
  const ImageButton({
    super.key,
    required this.image,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Tcolor.border.withOpacity(0.15)),
              color: Tcolor.grey60.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16)),
          alignment: Alignment.center,
          child: Image.asset(
            image,
            width: 50,
            height: 50,
            color: Tcolor.grey70,
          )),
    );
  }
}
