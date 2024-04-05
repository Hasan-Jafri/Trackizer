import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';
import 'package:trackizer/common_widget/primary_button.dart';
import 'package:trackizer/common_widget/round_textField.dart';
import 'package:trackizer/common_widget/secondary_button.dart';
import 'package:trackizer/view/login/sign_in_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
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
                  title: "E-mail address",
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
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      height: 5,
                      decoration: BoxDecoration(color: Tcolor.grey70),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      height: 5,
                      decoration: BoxDecoration(color: Tcolor.grey70),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      height: 5,
                      decoration: BoxDecoration(color: Tcolor.grey70),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      height: 5,
                      decoration: BoxDecoration(color: Tcolor.grey70),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Use 8 or more characters with a mix of letters,\nnumbers and symbols.",
                    style: TextStyle(fontSize: 12, color: Tcolor.grey50),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                  title: "Get Started, it's free.",
                  onpressed: () {},
                  fontSize: 16),
              const Spacer(),
              Text(
                "Do you have already an account?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Tcolor.white),
              ),
              const SizedBox(
                height: 20,
              ),
              SecondaryButton(
                  title: 'Sign in',
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInView()));
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
