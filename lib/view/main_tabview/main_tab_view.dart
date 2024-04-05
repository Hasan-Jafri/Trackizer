import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';
import 'package:trackizer/view/add_subscription/add_subscription_view.dart';
import 'package:trackizer/view/calender/calender_view.dart';
import 'package:trackizer/view/cards/cards_view.dart';
import 'package:trackizer/view/home/home_view.dart';
import 'package:trackizer/view/spending_widgets/spending_budget_view.dart';

class MainTab extends StatefulWidget {
  const MainTab({super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  int selectTab = 0;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentTabView = const HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolor.grey,
      body: Stack(
        children: [
          PageStorage(bucket: pageStorageBucket, child: currentTabView),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset("assets/img/bottom_bar_bg.png"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  selectTab = 0;
                                  currentTabView = const HomePage();
                                });
                              },
                              icon: Image.asset(
                                'assets/img/home.png',
                                width: 20,
                                height: 20,
                                color: selectTab == 0
                                    ? Tcolor.white
                                    : Tcolor.grey30,
                              )),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  selectTab = 1;
                                  currentTabView = const SpendingBudgetView();
                                });
                              },
                              icon: Image.asset(
                                'assets/img/budgets.png',
                                width: 20,
                                height: 20,
                                color: selectTab == 1
                                    ? Tcolor.white
                                    : Tcolor.grey30,
                              )),
                          const SizedBox(
                            width: 50,
                            height: 50,
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  selectTab = 2;
                                  currentTabView = const CalenderView();
                                });
                              },
                              icon: Image.asset(
                                'assets/img/calendar.png',
                                width: 20,
                                height: 20,
                                color: selectTab == 2
                                    ? Tcolor.white
                                    : Tcolor.grey30,
                              )),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  selectTab = 3;
                                  currentTabView = const CardView();
                                });
                              },
                              icon: Image.asset(
                                'assets/img/creditcards.png',
                                width: 20,
                                height: 20,
                                color: selectTab == 3
                                    ? Tcolor.white
                                    : Tcolor.grey30,
                              )),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddSubscriptionView()));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Tcolor.secondary.withOpacity(0.25),
                                blurRadius: 10,
                                offset: const Offset(0, 4))
                          ], borderRadius: BorderRadius.circular(50)),
                          child: Image.asset(
                            "assets/img/center_btn.png",
                            width: 55,
                            height: 55,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
