// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fmnine/core/colors/colors.dart';
import 'package:fmnine/core/constants/constants.dart';
import 'package:fmnine/models/services/auth_services/authentication.dart';
import 'package:fmnine/view/home/screens/home_screen.dart';
import 'package:pinput/pinput.dart';

class PhoneOtpScreen extends StatelessWidget {
  final String phoneNumber;
  PhoneOtpScreen({
    super.key,
    required this.phoneNumber,
  });

  final pinPutController = TextEditingController();
  final GlobalKey<FormState> phoneOtpKey = GlobalKey<FormState>();
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
              key: phoneOtpKey,
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
                      if (phoneOtpKey.currentState!.validate()) {
                        // Validate the OTP
                        final Map<String, dynamic> loginResult =
                            await authService.loginWithPhoneNumber(phoneNumber);

                        if (loginResult['status'] == 'success') {
                          log('Phone number login successful');
                          // Now, proceed with OTP verification
                          final Map<String, dynamic> otpVerificationResult =
                              await authService.phoneOtp(
                            phoneNumber,
                            pinPutController.text,
                          );
                          log('OTP Verification Result: $otpVerificationResult');
                          if (otpVerificationResult.containsKey('status')) {
                            if (otpVerificationResult['status'] == 'success') {
                              // Handle successful OTP verification
                              log('OTP verification successful. Navigating to HomeScreen...');
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            } else {
                              // Handle failed OTP verification
                              log('OTP verification failed. Showing SnackBar...');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'OTP validation failed: ${otpVerificationResult['message']}',
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            }
                          } else {
                            // Handle unexpected response from server
                            log('Unexpected response from server during OTP verification: $otpVerificationResult');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Unexpected response from server during OTP verification'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        }
                      }
                    },
                    child: const Text("Confirm"),
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
