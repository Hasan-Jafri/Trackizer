import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';

class SubscriptionHomeRow extends StatelessWidget {
  final Map sObj;
  final VoidCallback? onpressed;

  const SubscriptionHomeRow({super.key, required this.sObj, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onpressed,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 64,
          decoration: BoxDecoration(
              border: Border.all(color: Tcolor.border.withOpacity(0.15)),
              borderRadius: BorderRadius.circular(16)),
          alignment: Alignment.center,
          child: Row(
            children: [
              Image.asset(
                sObj['icon'],
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  sObj['name'],
                  style: TextStyle(
                      color: Tcolor.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                '\$${sObj['price']}',
                style: TextStyle(
                    color: Tcolor.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
