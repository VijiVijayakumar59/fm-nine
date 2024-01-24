// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fmnine/core/colors/colors.dart';
import 'package:fmnine/core/constants/constants.dart';
import 'package:fmnine/models/services/auth_services/google_sign_in.dart';
import 'package:fmnine/view/authentication/login/email/email_screen.dart';
import 'package:fmnine/view/home/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            "Login using",
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
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => PhoneAuthScreen(),
                      //   ),
                      // );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.12,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.phone,
                      ),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EmailAuthScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.12,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.mail,
                      ),
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
                  GestureDetector(
                    onTap: () async {
                      await FirebaseServices().signInWithGoogle();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.12,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/google.jpg",
                          ),
                        ),
                      ),
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
              // const KWidth(size: 0.08),
              // Column(
              //   children: [
              //     Container(
              //       height: MediaQuery.of(context).size.height * 0.06,
              //       width: MediaQuery.of(context).size.width * 0.12,
              //       decoration: BoxDecoration(
              //         color: whiteColor,
              //         borderRadius: BorderRadius.circular(12),
              //         image: const DecorationImage(
              //           image: AssetImage(
              //             "assets/images/facebook logo.png",
              //           ),
              //         ),
              //       ),
              //     ),
              //     const KHeight(size: 0.01),
              //     const Text(
              //       "Facebook",
              //       style: TextStyle(
              //         color: whiteColor,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
