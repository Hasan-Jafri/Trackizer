import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trackizer/common/common_extension.dart';
import 'package:trackizer/common_widget/primary_button.dart';
import 'package:trackizer/common_widget/secondary_button.dart';
import 'package:trackizer/view/login/sign_in_view.dart';
import 'package:trackizer/view/login/social_login.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/img/welcome_screen.png',
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                children: [
                  Image.asset(
                    'assets/img/app_logo.png',
                    width: media.width * 0.5,
                    fit: BoxFit.contain,
                  ),
                  const Spacer(),
                  Text(
                    "Welcome to Trackizer, your ultimate companion for \neffortless and efficient tracking of your tasks, goals, and productivity.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Tcolor.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  PrimaryButton(
                    title: "Get Started",
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SocialLogin()));
                    },
                    fontSize: 16,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SecondaryButton(
                      title: 'I have an account',
                      onpressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInView()));
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
