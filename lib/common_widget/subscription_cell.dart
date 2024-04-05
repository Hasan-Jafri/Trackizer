import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';

class SubscriptionCell extends StatelessWidget {
  final Map sObj;
  final VoidCallback? onpressed;

  const SubscriptionCell({super.key, required this.sObj, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onpressed,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 64,
          decoration: BoxDecoration(
              color: Tcolor.grey60.withOpacity(0.2),
              border: Border.all(color: Tcolor.border.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(16)),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                sObj['icon'],
                width: 40,
                height: 40,
              ),
              const Spacer(),
              Text(
                sObj['name'],
                style: TextStyle(
                    color: Tcolor.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '\$${sObj['price']}',
                style: TextStyle(
                    color: Tcolor.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
