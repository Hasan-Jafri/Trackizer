import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';
import 'package:trackizer/common_widget/primary_button.dart';
import 'package:trackizer/common_widget/secondary_button.dart';
import 'package:trackizer/view/login/sign_up_view.dart';

class SocialLogin extends StatefulWidget {
  const SocialLogin({super.key});

  @override
  State<SocialLogin> createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Tcolor.grey80,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/app_logo.png',
              width: media.width * 0.5,
              fit: BoxFit.contain,
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/img/apple_btn.png"),
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4)),
                    ]),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/apple.png',
                      width: 15,
                      height: 15,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Sign up with Apple",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: Tcolor.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/img/google_btn.png"),
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4)),
                    ]),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/google.png',
                      width: 15,
                      height: 15,
                      color: Tcolor.grey,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Sign up with Google",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: Tcolor.grey,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/img/fb_btn.png"),
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4)),
                    ]),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/fb.png',
                      width: 15,
                      height: 15,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Sign up with Facebook",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: Tcolor.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            PrimaryButton(
              title: "Get Started",
              onpressed: () {},
              fontSize: 16,
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              "Or",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Tcolor.white),
            ),
            const SizedBox(
              height: 35,
            ),
            SecondaryButton(
                title: 'Sign Up with email',
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpView()));
                }),
            const SizedBox(
              height: 15,
            ),
            Text(
              "By registering, you agree to our terms of Use. Learn how we collect, use and share your data.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Tcolor.white),
            ),
          ],
        ),
      ),
    );
  }
}
