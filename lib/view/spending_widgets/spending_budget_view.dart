import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trackizer/common/common_extension.dart';
import 'package:trackizer/common_widget/budget_row.dart';
import 'package:trackizer/common_widget/custom_arc_180_painter.dart';
import 'package:trackizer/view/settings/settings_view.dart';

class SpendingBudgetView extends StatefulWidget {
  const SpendingBudgetView({super.key});

  @override
  State<SpendingBudgetView> createState() => _SpendingBudgetViewState();
}

class _SpendingBudgetViewState extends State<SpendingBudgetView> {
  bool isSubscription = true;
  List budgetArr = [
    {
      'name': 'Auto & Transport',
      'icon': 'assets/img/auto_&_transport.png',
      'spendAmount': '149.99',
      'totalBudget': "400",
      'leftAmount': "250.01",
      'color': Tcolor.secondaryg
    },
    {
      'name': 'Entertainment',
      'icon': 'assets/img/entertainment.png',
      'spendAmount': '299.99',
      'totalBudget': "600",
      'leftAmount': "300.01",
      'color': Tcolor.secondary50
    },
    {
      'name': 'Security',
      'icon': 'assets/img/security.png',
      'spendAmount': '349.99',
      'totalBudget': "600",
      'leftAmount': "250.01",
      'color': Tcolor.primary10
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Tcolor.grey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Settings()));
                      },
                      icon: Image.asset(
                        'assets/img/settings.png',
                        width: 25,
                        height: 25,
                        color: Tcolor.grey30,
                      ))
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    width: media.width * 0.5,
                    height: media.width * 0.01,
                    child: CustomPaint(
                      painter: CustomArc180Painter(
                          end: 50,
                          width: 12,
                          bgWidth: 8,
                          drwArc: [
                            ArcValueModel(color: Tcolor.secondaryg, value: 20),
                            ArcValueModel(color: Tcolor.secondary, value: 45),
                            ArcValueModel(color: Tcolor.primary10, value: 70)
                          ]),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '\$82.90',
                        style: TextStyle(
                            color: Tcolor.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'of \$2,000 budget',
                        style: TextStyle(
                            color: Tcolor.grey30,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {},
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Tcolor.border.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(16)),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Your budgets are on track 👍",
                          style: TextStyle(
                              color: Tcolor.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (isSubscription)
                ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  itemBuilder: (context, index) {
                    var sObj = budgetArr[index] as Map;
                    return BudgetsRow(
                      sObj: sObj,
                      onpressed: () {},
                    );
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: budgetArr.length,
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      height: 64,
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
                            "Add new category",
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
      ),
    );
  }
}
