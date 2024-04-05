import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';
import 'package:trackizer/common_widget/icon_item_row.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolor.grey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Image.asset(
                            'assets/img/back.png',
                            width: 25,
                            height: 25,
                            color: Tcolor.grey30,
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Settings',
                        style: TextStyle(color: Tcolor.grey30, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/u1.png',
                    width: 70,
                    height: 70,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Hasan Jafry',
                  style: TextStyle(
                      color: Tcolor.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ]),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'mohammadhasanstd@gmail.com',
                    style: TextStyle(
                        color: Tcolor.grey30,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Tcolor.border.withOpacity(0.15)),
                      color: Tcolor.grey60.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    "Edit profile",
                    style: TextStyle(
                        color: Tcolor.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 8,
                      ),
                      child: Text(
                        "General",
                        style: TextStyle(
                            color: Tcolor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: Tcolor.grey60.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          children: [
                            const IconItemRow(
                                title: 'Security',
                                icon: "assets/img/face_id.png",
                                value: "FaceID"),
                            IconItemSwitchRow(
                              title: 'iCloud Sync',
                              icon: "assets/img/icloud.png",
                              value: false,
                              didChange: (newVal) {
                                setState(() {
                                  isActive = newVal;
                                });
                              },
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 8,
                      ),
                      child: Text(
                        "My Subscriptions",
                        style: TextStyle(
                            color: Tcolor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: Tcolor.grey60.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Column(
                          children: [
                            IconItemRow(
                                title: 'Sorting',
                                icon: "assets/img/sorting.png",
                                value: "Date"),
                            IconItemRow(
                              title: 'Summary',
                              icon: "assets/img/chart.png",
                              value: 'Average',
                            ),
                            IconItemRow(
                              title: 'Default currency',
                              icon: "assets/img/money.png",
                              value: 'USD (\$)',
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 8,
                      ),
                      child: Text(
                        "Appearance",
                        style: TextStyle(
                            color: Tcolor.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: Tcolor.grey60.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Column(
                          children: [
                            IconItemRow(
                                title: 'App icon',
                                icon: "assets/img/app_icon.png",
                                value: "Default"),
                            IconItemRow(
                              title: 'Theme',
                              icon: "assets/img/light_theme.png",
                              value: 'Dark',
                            ),
                            IconItemRow(
                              title: 'Font',
                              icon: "assets/img/font.png",
                              value: 'Inter',
                            ),
                          ],
                        )),
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
