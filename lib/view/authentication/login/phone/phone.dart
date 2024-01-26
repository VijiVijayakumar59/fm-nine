// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fmnine/core/constants/constants.dart';
import 'package:fmnine/models/services/auth_services/authentication.dart';
import 'package:fmnine/view/authentication/login/phone/otp_phone.dart';
import 'package:fmnine/view/authentication/register/register_screen.dart';
import 'package:fmnine/view/authentication/login/widgets/elevated_button.dart';
import 'package:fmnine/view/authentication/login/widgets/textform_widget.dart';

class PhoneAuthScreen extends StatelessWidget {
  PhoneAuthScreen({super.key});
  TextEditingController phoneController = TextEditingController();

  final AuthService authService = AuthService();
  final GlobalKey<FormState> phoneKey = GlobalKey<FormState>();

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
              key: phoneKey,
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
                    hintText: "Phone number",
                    textController: phoneController,
                    prefixIcon: Icons.phone,
                  ),
                  const KHeight(
                    size: 0.02,
                  ),
                  const KHeight(
                    size: 0.02,
                  ),
                  ElevatedButtonWidget(
                    text: "Send OTP",
                    bgColor: const Color.fromARGB(255, 255, 26, 10),
                    onPress: () async {
                      if (phoneKey.currentState!.validate()) {
                        log('Validation success');

                        // Call phone login function
                        final Map<String, dynamic> phoneLoginResult =
                            await authService
                                .loginWithPhoneNumber(phoneController.text);
                        log(phoneLoginResult.toString());
                        if (phoneLoginResult['success']) {
                          // Phone login was successful
                          log('Phone number login successful');

                          // Log the response for debugging
                          log('Response from server: $phoneLoginResult');

                          // Navigate to OTP verification screen
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PhoneOtpScreen(
                                phoneNumber: phoneController.text,
                              ),
                            ),
                          );
                        } else {
                          // Phone login failed
                          log('Phone number login failed');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Phone number login failed: ${phoneLoginResult['message'] ?? "Unknown error"}',
                              ),
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
