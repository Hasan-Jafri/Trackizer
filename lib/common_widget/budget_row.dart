import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';

class BudgetsRow extends StatelessWidget {
  final Map sObj;
  final VoidCallback? onpressed;

  const BudgetsRow({super.key, required this.sObj, this.onpressed});

  @override
  Widget build(BuildContext context) {
    var proVal = (double.tryParse(sObj['leftAmount']) ?? 0) /
        (double.tryParse(sObj['totalBudget']) ?? 1);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onpressed,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Tcolor.border.withOpacity(0.15)),
              borderRadius: BorderRadius.circular(16),
              color: Tcolor.grey60.withOpacity(0.1)),
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      sObj['icon'],
                      width: 30,
                      height: 30,
                      color: Tcolor.grey40,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sObj['name'],
                          style: TextStyle(
                              color: Tcolor.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '\$${sObj["leftAmount"]} left to spend',
                          style: TextStyle(
                              color: Tcolor.grey30,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$${sObj["spendAmount"]}',
                        style: TextStyle(
                            color: Tcolor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '\$${sObj["totalBudget"]}',
                        style: TextStyle(
                            color: Tcolor.grey30,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              LinearProgressIndicator(
                backgroundColor: Tcolor.grey60,
                minHeight: 3,
                valueColor: AlwaysStoppedAnimation(sObj['color']),
                value: proVal,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
