import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';
import 'package:trackizer/common_widget/item_row.dart';
import 'package:trackizer/common_widget/secondary_button.dart';

class SubscriptionInfo extends StatefulWidget {
  final Map sObj;
  const SubscriptionInfo({super.key, required this.sObj});

  @override
  State<SubscriptionInfo> createState() => _SubscriptionInfoState();
}

class _SubscriptionInfoState extends State<SubscriptionInfo> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Tcolor.grey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF282833).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Container(
                      height: media.width * 0.9 + 15,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Tcolor.grey70,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Image.asset(
                                    'assets/img/dorp_down.png',
                                    width: 20,
                                    height: 20,
                                    color: Tcolor.grey30,
                                  )),
                              Text(
                                'Subscription Info',
                                style: TextStyle(
                                    color: Tcolor.grey30, fontSize: 16),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Image.asset(
                                    'assets/img/Trash.png',
                                    width: 25,
                                    height: 25,
                                    color: Tcolor.grey30,
                                  )),
                            ],
                          ),
                          const Spacer(),
                          Image.asset(
                            widget.sObj['icon'],
                            width: media.width * 0.25,
                            height: media.width * 0.25,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.sObj['name'],
                            style: TextStyle(
                                color: Tcolor.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            '\$${widget.sObj['price']}',
                            style: TextStyle(
                                color: Tcolor.grey30,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Container(
                      height: media.width * 1,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: Tcolor.grey60.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Column(
                                children: [
                                  ItemRow(
                                      title: 'Name',
                                      value: widget.sObj['name']),
                                  const ItemRow(
                                      title: 'Description', value: 'Music app'),
                                  const ItemRow(
                                      title: 'Category',
                                      value: "Entertainment"),
                                  const ItemRow(
                                      title: 'First payment',
                                      value: '08.07.23'),
                                  const ItemRow(
                                      title: 'Reminder', value: 'Never'),
                                  const ItemRow(
                                      title: 'Currency', value: 'USD(\$)'),
                                ],
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          SecondaryButton(title: 'Save', onpressed: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                height: media.width * 0.9 + 25,
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Tcolor.grey,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Expanded(
                      child: DottedBorder(
                          dashPattern: const [5, 10],
                          strokeWidth: 1,
                          padding: EdgeInsets.zero,
                          radius: const Radius.circular(16),
                          borderType: BorderType.RRect,
                          color: Tcolor.grey,
                          child: const SizedBox(
                            height: 0,
                          )),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Tcolor.grey,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
