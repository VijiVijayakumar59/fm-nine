// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fmnine/view/onboarding/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goOnboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/FM 9  Logo.png'),
          fit: BoxFit.contain,
        )),
      ),
    ));
  }

  Future<void> goOnboard() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const OnboardScreen(),
      ),
    );
  }
}
