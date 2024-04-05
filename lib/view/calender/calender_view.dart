import 'dart:math';

import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';
import 'package:trackizer/common_widget/subscription_cell.dart';
import 'package:trackizer/view/settings/settings_view.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  CalendarAgendaController calendarAgendaControllerAppBar =
      CalendarAgendaController();
  CalendarAgendaController calendarAgendaControllerNotAppBar =
      CalendarAgendaController();

  late DateTime selectedDateNotAppBBar;

  Random random = Random();
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

  @override
  void initState() {
    super.initState();

    selectedDateNotAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolor.grey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Tcolor.grey70.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Calender",
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
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Subs\nSchedule",
                      style: TextStyle(
                          color: Tcolor.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "3 Subscriptions for today",
                          style: TextStyle(
                              color: Tcolor.grey30,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            calendarAgendaControllerNotAppBar
                                .openFullCalender();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Tcolor.border.withOpacity(0.1)),
                                color: Tcolor.grey60.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12)),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "January",
                                  style: TextStyle(
                                      color: Tcolor.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.expand_more,
                                  color: Tcolor.white,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    CalendarAgenda(
                      fullCalenderBackgroundColor: Tcolor.grey80,
                      controller: calendarAgendaControllerNotAppBar,

                      // fullCalendar: false,
                      locale: 'en',
                      backgroundColor: Colors.transparent,
                      weekDay: WeekDay.short,
                      fullCalendarDay: WeekDay.short,
                      selectedDateColor: Tcolor.white,
                      initialDate: DateTime.now(),
                      calendarEventColor: Tcolor.secondary,
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 140)),
                      lastDate: DateTime.now().add(const Duration(days: 140)),
                      events: List.generate(
                          100,
                          (index) => DateTime.now().subtract(
                              Duration(days: index * random.nextInt(5)))),
                      onDateSelected: (date) {
                        setState(() {
                          selectedDateNotAppBBar = date;
                        });
                      },
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Tcolor.border.withOpacity(0.15)),
                          color: Tcolor.grey60.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12)),
                      selectDecoration: BoxDecoration(
                          border: Border.all(
                              color: Tcolor.border.withOpacity(0.15)),
                          color: Tcolor.grey60,
                          borderRadius: BorderRadius.circular(12)),
                      selectedEventLogo: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Tcolor.secondary,
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      eventLogo: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Tcolor.secondary,
                            borderRadius: BorderRadius.circular(3)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "January",
                        style: TextStyle(
                            color: Tcolor.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$24.98",
                        style: TextStyle(
                            color: Tcolor.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "01.08.2024",
                        style: TextStyle(
                            color: Tcolor.grey30,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "in upcoming bills",
                        style: TextStyle(
                            color: Tcolor.grey30,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              ),
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1),
              itemBuilder: (context, index) {
                var sObj = subArr[index] as Map? ?? {};
                return SubscriptionCell(
                  sObj: sObj,
                  onpressed: () {},
                );
              },
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
