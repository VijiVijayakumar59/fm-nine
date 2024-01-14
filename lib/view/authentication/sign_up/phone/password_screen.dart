// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fmnine/core/colors/colors.dart';
import 'package:fmnine/core/constants/constants.dart';
import 'package:fmnine/view/authentication/sign_up/widgets/textform_widget.dart';
import 'package:fmnine/view/home/screens/home_screen.dart';

class PasswordSetup extends StatelessWidget {
  PasswordSetup({super.key});

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
          8,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Set your Password",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const KHeight(
                size: 0.04,
              ),
              TextFormWidget(
                hintText: "Enter your password",
                textController: passwordController,
                prefixIcon: Icons.lock_outline,
                suffixIcon: Icons.visibility_off_outlined,
              ),
              const KHeight(
                size: 0.02,
              ),
              TextFormWidget(
                hintText: "Confirm your password",
                textController: confirmpasswordController,
                prefixIcon: Icons.lock_outline,
                suffixIcon: Icons.visibility_off_outlined,
              ),
              const KHeight(
                size: 0.02,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: whiteColor,
                  backgroundColor: Colors.red,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Sign Up",
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
