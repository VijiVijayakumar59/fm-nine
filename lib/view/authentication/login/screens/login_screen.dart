import 'package:flutter/material.dart';
import 'package:fmnine/core/colors/colors.dart';
import 'package:fmnine/core/constants/constants.dart';
import 'package:fmnine/view/authentication/sign_up/screens/sign_up_screen.dart';
import 'package:fmnine/view/authentication/sign_up/widgets/elevated_button.dart';
import 'package:fmnine/view/authentication/sign_up/widgets/textform_widget.dart';
import 'package:fmnine/view/home/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<LoginScreen> {
  List<TextEditingController> emailPhoneController = [
    TextEditingController(),
    TextEditingController(),
  ];
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 8),
          child: SingleChildScrollView(
            child: Column(
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const KHeight(
                  size: 0.02,
                ),
                const KHeight(
                  size: 0.02,
                ),
                // EmailPhoneTextWidget(
                //   textControllers: emailPhoneController,
                //   hintText: "Email/Phone",
                //   prefixIcon: Icons.mail_outline,
                // ),
                const KHeight(
                  size: 0.02,
                ),
                TextFormWidget(
                  textController: passwordController,
                  hintText: "Password",
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: Icons.visibility_off_outlined,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text(
                        "Forget Password",
                      ),
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => ResetPassword(),
                        //   ),
                        // );
                      },
                    ),
                  ],
                ),
                // const TextformHeight(),
                // const TextformHeight(),
                // const TextformHeight(),
                ElevatedButtonWidget(
                  text: "Sign in",
                  bgColor: const Color.fromARGB(255, 255, 26, 10),
                  onPress: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
                const KHeight(
                  size: 0.02,
                ),
                const Text(
                  "or sign in with",
                  style: TextStyle(
                      // color: twhitecolor,
                      ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: whiteColor,
                    ),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/google.jpg',
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account",
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignUpEmail(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
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
    );
  }
}
