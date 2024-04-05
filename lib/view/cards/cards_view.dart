import 'package:card_swiper/card_swiper.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';
import 'package:trackizer/view/settings/settings_view.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
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

  List cardArr = [
    {
      "name": 'Hasan Jafry',
      'number': '**** **** **** 2240',
      'month_year': '08/27'
    },
    {
      "name": 'Muhammad Hassan',
      'number': '**** **** **** 2970',
      'month_year': '09/25'
    },
    {
      "name": 'Hassan Jafri',
      'number': '**** **** **** 2189',
      'month_year': '11/28'
    },
    {
      "name": 'Syed Hasan',
      'number': '**** **** **** 2323',
      'month_year': '05/24'
    },
  ];
  SwiperController controller = SwiperController();

  Widget buildSwiper() {
    return Swiper(
      itemCount: cardArr.length,
      customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
        ..addRotate([-45 / 180, 0.0, 45.0 / 180])
        ..addTranslate(
            [const Offset(-370, -40), Offset.zero, const Offset(-370, -40)]),
      fade: 1.0,
      onIndexChanged: (index) {},
      scale: 0.8,
      itemWidth: 232.0,
      itemHeight: 350,
      controller: controller,
      layout: SwiperLayout.STACK,
      viewportFraction: 0.8,
      itemBuilder: (context, index) {
        var cObj = cardArr[index] as Map? ?? {};
        return Container(
          decoration: BoxDecoration(
            color: Tcolor.grey70,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/img/card_blank.png',
                width: 232,
                height: 350,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/img/mastercard_logo.png',
                    width: 50,
                  ),
                  Text(
                    "Virtual Card",
                    style: TextStyle(
                        color: Tcolor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  Text(
                    cObj['name'] ?? "Hasan Jafry",
                    style: TextStyle(
                        color: Tcolor.grey20,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    cObj['number'] ?? "**** **** **** 2248",
                    style: TextStyle(
                        color: Tcolor.grey20,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    cObj['month_year'] ?? "08/27",
                    style: TextStyle(
                        color: Tcolor.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      autoplayDisableOnInteraction: false,
      axisDirection: AxisDirection.right,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolor.grey,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              width: double.infinity,
              height: 600,
              child: buildSwiper(),
            ),
            Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Credit Cards",
                              style: TextStyle(
                                color: Tcolor.grey30,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Row(
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
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 420,
                ),
                Text(
                  "Subscriptions",
                  style: TextStyle(
                    color: Tcolor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: subArr.map((sObj) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 8),
                        child: Image.asset(
                          sObj['icon'],
                          width: 40,
                          height: 40,
                        ),
                      );
                    }).toList()),
                const SizedBox(
                  height: 90,
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Tcolor.grey70.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {},
                          child: DottedBorder(
                            dashPattern: const [3, 4],
                            strokeWidth: 1,
                            radius: const Radius.circular(16),
                            borderType: BorderType.RRect,
                            color: Tcolor.border.withOpacity(0.1),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16)),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Add new card",
                                    style: TextStyle(
                                        color: Tcolor.grey30,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "assets/img/add.png",
                                    width: 12,
                                    height: 12,
                                    color: Tcolor.grey30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
