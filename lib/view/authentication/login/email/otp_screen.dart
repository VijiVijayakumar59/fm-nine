// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fmnine/core/colors/colors.dart';
import 'package:fmnine/core/constants/constants.dart';
import 'package:fmnine/models/services/auth_services/authentication.dart';
import 'package:fmnine/view/authentication/login/email/email_screen.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatelessWidget {
  final String? userName;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final VoidCallback onVerificationSuccess;

  OtpVerification({
    super.key,
    this.userName,
    this.email,
    this.phoneNumber,
    this.password,
    required this.onVerificationSuccess,
  });

  final pinPutController = TextEditingController();
  final GlobalKey<FormState> otpKey = GlobalKey<FormState>();
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
          title: const Text(
            "OTP Verification",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 220,
              left: 8,
              right: 8,
            ),
            child: Form(
              key: otpKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Enter your otp",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const KHeight(
                    size: 0.03,
                  ),
                  Center(
                    child: Pinput(
                      length: 6,
                      defaultPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                      ),
                      submittedPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                      ),

                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      // autofocus: true,
                      keyboardType: TextInputType.number,
                      controller: pinPutController,
                    ),
                  ),
                  const KHeight(size: 0.04),
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
                    onPressed: () async {
                      if (otpKey.currentState!.validate()) {
                        log('Validation success');

                        Map<String, dynamic> otpValidationResult =
                            await authService.verifyOTP(
                          userName!,
                          email!,
                          phoneNumber!,
                          password!,
                          pinPutController.text,
                        );

                        log('OTP Validation Result: $otpValidationResult');

                        if (otpValidationResult.containsKey('status')) {
                          if (otpValidationResult['status'] == 'success') {
                            log('OTP validation successful');
                            onVerificationSuccess();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EmailAuthScreen(
                                  userName: userName!,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'OTP validation failed: ${otpValidationResult['message']}',
                                ),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Unexpected response from server'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text(
                      "Confirm",
                    ),
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
