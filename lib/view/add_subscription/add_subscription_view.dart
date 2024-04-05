import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';
import 'package:trackizer/common_widget/image_button.dart';
import 'package:trackizer/common_widget/primary_button.dart';
import 'package:trackizer/common_widget/round_textField.dart';

class AddSubscriptionView extends StatefulWidget {
  const AddSubscriptionView({super.key});

  @override
  State<AddSubscriptionView> createState() => _AddSubscriptionViewState();
}

class _AddSubscriptionViewState extends State<AddSubscriptionView> {
  TextEditingController txtdecription = TextEditingController();
  List subArr = [
    {'name': 'HBO GO', 'icon': 'assets/img/hbo_logo.png'},
    {
      'name': 'YouTube Premium',
      'icon': 'assets/img/youtube_logo.png',
    },
    {
      'name': 'Netlfix',
      'icon': 'assets/img/netflix_logo.png',
    },
    {
      'name': 'Microsoft OneDrive',
      'icon': 'assets/img/onedrive_logo.png',
    },
  ];
  double amountVal = 0.09;
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
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                              'New',
                              style:
                                  TextStyle(color: Tcolor.grey30, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Add new subscriptions',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Tcolor.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                        width: media.width,
                        height: media.height * 0.2,
                        child: CarouselSlider.builder(
                            options: CarouselOptions(
                                autoPlay: false,
                                aspectRatio: 1,
                                enableInfiniteScroll: true,
                                viewportFraction: 0.65,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.4,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.zoom),
                            itemCount: subArr.length,
                            itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) {
                              var sObj = subArr[itemIndex] as Map? ?? {};
                              return Container(
                                margin: const EdgeInsets.symmetric(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      sObj['icon'],
                                      width: media.width * 0.3,
                                      height: media.width * 0.3,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    const Spacer(),
                                    Text(
                                      sObj['name'],
                                      style: TextStyle(
                                          color: Tcolor.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              );
                            })),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: RoundedTextField(
                controller: txtdecription,
                title: 'Description',
                titleAlign: TextAlign.center,
                inputType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageButton(
                    image: 'assets/img/minus.png',
                    onpressed: () {
                      setState(() {
                        amountVal -= 0.1;
                        if (amountVal < 0) {
                          amountVal = 0;
                        }
                      });
                    },
                  ),
                  Column(
                    children: [
                      Text(
                        'Monthly price',
                        style: TextStyle(
                            color: Tcolor.grey40,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '\$${amountVal.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Tcolor.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 150,
                        height: 1,
                        color: Tcolor.grey70,
                      ),
                    ],
                  ),
                  ImageButton(
                    image: 'assets/img/plus.png',
                    onpressed: () {
                      setState(() {
                        amountVal += 0.1;
                        if (amountVal < 0) {
                          amountVal = 0;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
                  PrimaryButton(title: 'Add this platform', onpressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
