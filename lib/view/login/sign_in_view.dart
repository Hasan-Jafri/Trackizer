import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';
import 'package:trackizer/common_widget/primary_button.dart';
import 'package:trackizer/common_widget/round_textField.dart';
import 'package:trackizer/common_widget/secondary_button.dart';
import 'package:trackizer/view/login/sign_up_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Tcolor.grey80,
      body: SafeArea(
        child: Padding(
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
              const SizedBox(
                height: 20,
              ),
              RoundedTextField(
                  title: "Login",
                  controller: email,
                  inputType: TextInputType.text),
              const SizedBox(
                height: 15,
              ),
              RoundedTextField(
                title: "Password",
                controller: password,
                inputType: TextInputType.text,
                obscureText: true,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isRemember = !isRemember;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isRemember
                              ? Icons.check_box_rounded
                              : Icons.check_box_outline_blank_rounded,
                          size: 25,
                          color: Tcolor.grey50,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Remember Me",
                          style: TextStyle(fontSize: 14, color: Tcolor.grey50),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(fontSize: 14, color: Tcolor.grey50),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              PrimaryButton(
                  title: "Get Started, it's free.",
                  onpressed: () {},
                  fontSize: 16),
              const Spacer(),
              Text(
                "If you don't have an account yet",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Tcolor.white),
              ),
              const SizedBox(
                height: 20,
              ),
              SecondaryButton(
                  title: 'Sign up',
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpView()));
                  }),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
