import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';
import 'package:trackizer/common_widget/custom_arc_painter.dart';
import 'package:trackizer/common_widget/segment_button.dart';
import 'package:trackizer/common_widget/status_button.dart';
import 'package:trackizer/common_widget/subscription_home_row.dart';
import 'package:trackizer/common_widget/upcoming_bills_row.dart';
import 'package:trackizer/view/settings/settings_view.dart';
import 'package:trackizer/view/subscription_info_screen/subscription_info_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSubscription = true;
  List subArr = [
    {'name': 'Spotify', 'icon': 'assets/img/spotify_logo.png', 'price': '5.99'},
    {
      'name': 'YouTube Premium',
      'icon': 'assets/img/youtube_logo.png',
      'price': '18.99'
    },
    {
      'name': 'Netlfix',
      'icon': 'assets/img/netflix_logo.png',
      'price': '15.00'
    },
    {
      'name': 'Microsoft OneDrive',
      'icon': 'assets/img/onedrive_logo.png',
      'price': '29.99'
    },
  ];

  // ignore: non_constant_identifier_names
  List Billarr = [
    {'name': 'Spotify', 'date': DateTime(2024, 01, 25), 'price': '5.99'},
    {
      'name': 'YouTube Premium',
      'date': DateTime(2024, 01, 25),
      'price': '18.99'
    },
    {'name': 'Netlfix', 'date': DateTime(2024, 01, 25), 'price': '15.00'},
    {
      'name': 'Microsoft OneDrive',
      'date': DateTime(2024, 01, 25),
      'price': '29.99'
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Tcolor.grey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.height * 0.5,
              decoration: BoxDecoration(
                color: Tcolor.grey70.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/img/home_bg.png'),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: media.width * 0.05),
                        width: media.width * 0.7,
                        height: media.height * 0.7,
                        child: CustomPaint(
                          painter: CustomArcPainter(end: 220),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35, right: 10),
                        child: Row(
                          children: [
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Settings()));
                                },
                                icon: Image.asset(
                                  'assets/img/settings.png',
                                  width: 25,
                                  height: 25,
                                  color: Tcolor.grey30,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Image.asset(
                        'assets/img/app_logo.png',
                        width: media.width * 0.25,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: media.width * 0.07,
                      ),
                      Text(
                        "\$1,235",
                        style: TextStyle(
                            color: Tcolor.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: media.width * 0.055,
                      ),
                      Text(
                        "This month bills",
                        style: TextStyle(
                            color: Tcolor.grey40,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: media.width * 0.07),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Tcolor.border.withOpacity(0.15)),
                              color: Tcolor.grey60.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            "See your budget",
                            style: TextStyle(
                                color: Tcolor.grey30,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                                child: StatusButton(
                              title: "Active Subs",
                              value: '12',
                              statuscolor: Tcolor.secondary,
                              onpressed: () {},
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: StatusButton(
                              title: "Highest Subs",
                              value: '\$19.99',
                              statuscolor: Tcolor.primary10,
                              onpressed: () {},
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: StatusButton(
                              title: "Lowest Subs",
                              value: '\$5.99',
                              statuscolor: Tcolor.secondaryg,
                              onpressed: () {},
                            ))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: SegmentButton(
                    title: 'Your Subscription',
                    isActive: isSubscription,
                    onpressed: () {
                      setState(() {
                        isSubscription = !isSubscription;
                      });
                    },
                  )),
                  const SizedBox(),
                  Expanded(
                      child: SegmentButton(
                    title: 'Upcoming Bills',
                    isActive: !isSubscription,
                    onpressed: () {
                      setState(() {
                        isSubscription = !isSubscription;
                      });
                    },
                  ))
                ],
              ),
            ),
            if (isSubscription)
              ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                itemBuilder: (context, index) {
                  var sObj = subArr[index] as Map;
                  return SubscriptionHomeRow(
                    sObj: sObj,
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SubscriptionInfo(sObj: sObj)));
                    },
                  );
                },
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: subArr.length,
              ),
            if (!isSubscription)
              ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                itemBuilder: (context, index) {
                  var sObj = subArr[index] as Map;
                  return UpcomingBills(
                    sObj: sObj,
                    onpressed: () {},
                  );
                },
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: subArr.length,
              ),
            const SizedBox(
              height: 65,
            ),
          ],
        ),
      ),
    );
  }
}
