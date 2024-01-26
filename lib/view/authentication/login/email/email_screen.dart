// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fmnine/core/constants/constants.dart';
import 'package:fmnine/models/services/auth_services/authentication.dart';
import 'package:fmnine/view/authentication/register/register_screen.dart';
import 'package:fmnine/view/authentication/login/widgets/elevated_button.dart';
import 'package:fmnine/view/authentication/login/widgets/textform_widget.dart';
import 'package:fmnine/view/home/screens/home_screen.dart';

class EmailAuthScreen extends StatelessWidget {
  final String? userName;
  EmailAuthScreen({super.key, this.userName});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 2, left: 20, right: 20, bottom: 8),
          child: SingleChildScrollView(
            child: Form(
              key: loginKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.height * 0.3,
                      child: Image.asset(
                        "assets/images/FM 9  Logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const KHeight(
                    size: 0.02,
                  ),
                  TextFormWidget(
                    hintText: "Email",
                    textController: emailController,
                    prefixIcon: Icons.email_outlined,
                  ),
                  const KHeight(
                    size: 0.02,
                  ),
                  TextFormWidget(
                    hintText: "Enter your password",
                    textController: passwordController,
                    prefixIcon: Icons.lock_outline_rounded,
                  ),
                  const KHeight(
                    size: 0.04,
                  ),
                  ElevatedButtonWidget(
                    text: "Login",
                    bgColor: const Color.fromARGB(255, 255, 26, 10),
                    onPress: () async {
                      if (loginKey.currentState!.validate()) {
                        log('Validation success');

                        Map<String, dynamic> loginResult =
                            await authService.login(
                          emailController.text,
                          passwordController.text,
                        );

                        log('Login Result: $loginResult');

                        if (loginResult.containsKey('success') &&
                            loginResult['success']) {
                          log('Login successful');

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                userName: userName.toString(),
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Login failed: ${loginResult['error']}'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                      }
                    },
                  ),
                  const KHeight(
                    size: 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "New user?",
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
