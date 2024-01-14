import 'package:flutter/material.dart';
import 'package:fmnine/core/colors/colors.dart';
import 'package:fmnine/core/constants/constants.dart';
import 'package:fmnine/view/authentication/sign_up/email/sign_up_screen.dart';
import 'package:fmnine/view/authentication/sign_up/phone/phone.dart';

class LoginOrSignup extends StatelessWidget {
  const LoginOrSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 400,
              width: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/FM 9  Logo.png",
                  ),
                ),
              ),
            ),
          ),
          const Text(
            "Login / Sign up using",
            style: TextStyle(
              color: whiteColor,
              fontSize: 16,
            ),
          ),
          const KHeight(size: 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  FloatingActionButton(
                    backgroundColor: whiteColor,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PhoneAuthScreen(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.phone,
                    ),
                  ),
                  const KHeight(size: 0.01),
                  const Text(
                    "Phone",
                    style: TextStyle(
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
              const KWidth(size: 0.08),
              Column(
                children: [
                  FloatingActionButton(
                    backgroundColor: whiteColor,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignUpEmail(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.mail,
                    ),
                  ),
                  const KHeight(size: 0.01),
                  const Text(
                    "Email",
                    style: TextStyle(
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
              const KWidth(size: 0.08),
              Column(
                children: [
                  FloatingActionButton(
                    backgroundColor: whiteColor,
                    onPressed: () {},
                    child: Image.asset(
                      "assets/images/google.jpg",
                      fit: BoxFit.contain,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const KHeight(size: 0.01),
                  const Text(
                    "Google",
                    style: TextStyle(
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
              const KWidth(size: 0.08),
              Column(
                children: [
                  FloatingActionButton(
                    backgroundColor: whiteColor,
                    onPressed: () {},
                    child: Image.asset(
                      "assets/images/facebook logo.png",
                      fit: BoxFit.contain,
                      height: 62,
                      width: 62,
                    ),
                  ),
                  const KHeight(size: 0.01),
                  const Text(
                    "Facebook",
                    style: TextStyle(
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
