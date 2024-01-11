import 'package:flutter/material.dart';
import 'package:fmnine/core/colors/colors.dart';
import 'package:fmnine/core/constants/constants.dart';
import 'package:fmnine/presentation/authentication/login/screens/login_screen.dart';
import 'package:fmnine/presentation/authentication/sign_up/widgets/elevated_button.dart';
import 'package:fmnine/presentation/authentication/sign_up/widgets/textform_widget.dart';
import 'package:fmnine/presentation/home/screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List<TextEditingController> emailPhoneController = [
    TextEditingController(),
    TextEditingController(),
  ];
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(top: 2, left: 20, right: 20, bottom: 8),
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
                  "Sign Up",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const KHeight(
                  size: 0.02,
                ),
                TextFormWidget(
                  textController: nameController,
                  hintText: "Username",
                  prefixIcon: Icons.person_2_outlined,
                ),
                const KHeight(
                  size: 0.02,
                ),
                EmailPhoneTextWidget(
                  textControllers: emailPhoneController,
                  hintText: "Email/Phone",
                  prefixIcon: Icons.mail_outline,
                ),
                const KHeight(
                  size: 0.02,
                ),
                TextFormWidget(
                  textController: passwordController,
                  hintText: "Password",
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: Icons.visibility_off_outlined,
                ),
                const KHeight(
                  size: 0.02,
                ),
                TextFormWidget(
                  textController: confirmpasswordController,
                  hintText: "Confirm Password",
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: Icons.visibility_off_outlined,
                ),
                const KHeight(
                  size: 0.02,
                ),
                const KHeight(
                  size: 0.02,
                ),
                ElevatedButtonWidget(
                  text: "Sign Up",
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
                      "Already an user?",
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
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
