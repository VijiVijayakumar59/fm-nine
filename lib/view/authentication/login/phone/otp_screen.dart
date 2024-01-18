import 'package:flutter/material.dart';
import 'package:fmnine/core/colors/colors.dart';
import 'package:fmnine/core/constants/constants.dart';
import 'package:fmnine/view/home/screens/home_screen.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({super.key});

  final pinPutController = TextEditingController();
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
            padding: const EdgeInsets.only(top: 250),
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
                    // validator: (s) {
                    //   return s == '2222' ? null : 'Pin is incorrect';
                    // },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    controller: pinPutController,
                    // onCompleted: (pin) => print(pin),
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
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
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
    );
  }
}
