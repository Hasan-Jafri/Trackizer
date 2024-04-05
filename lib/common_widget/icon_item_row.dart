import 'package:flutter/cupertino.dart';
import 'package:trackizer/common/common_extension.dart';

class IconItemRow extends StatelessWidget {
  final String title;
  final String value;
  final String icon;
  const IconItemRow(
      {super.key,
      required this.title,
      required this.value,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 20,
            height: 20,
            color: Tcolor.grey20,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: TextStyle(
                color: Tcolor.white, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Tcolor.grey30,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Image.asset(
            'assets/img/next.png',
            width: 12,
            height: 12,
            color: Tcolor.grey30,
          ),
        ],
      ),
    );
  }
}

class IconItemSwitchRow extends StatelessWidget {
  final String title;
  final bool value;
  final String icon;
  final Function(bool) didChange;
  const IconItemSwitchRow(
      {super.key,
      required this.title,
      required this.value,
      required this.icon,
      required this.didChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 20,
            height: 20,
            color: Tcolor.grey20,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: TextStyle(
                color: Tcolor.white, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          const SizedBox(
            width: 8,
          ),
          CupertinoSwitch(value: value, onChanged: didChange)
        ],
      ),
    );
  }
}
