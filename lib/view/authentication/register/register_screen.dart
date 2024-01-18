// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:fmnine/core/constants/constants.dart';
import 'package:fmnine/view/authentication/login_with.dart';
import 'package:fmnine/view/authentication/login/widgets/elevated_button.dart';
import 'package:fmnine/view/authentication/login/widgets/textform_widget.dart';
import 'package:fmnine/view/home/screens/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
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
                  validator: (value) {
                    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value!) ||
                        value == null ||
                        value.isEmpty ||
                        value.length < 4) {
                      return 'Username can only contain letters, numbers, and underscores';
                    } else {
                      return null;
                    }
                  },
                  textController: nameController,
                  hintText: "Username",
                  prefixIcon: Icons.person_2_outlined,
                ),
                const KHeight(
                  size: 0.02,
                ),
                TextFormWidget(
                  validator: (value) {
                    
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return "Enter Valid Email";
                    } else {
                      return null;
                    }
                  },
                  textController: emailController,
                  hintText: "Enter your email",
                  prefixIcon: Icons.email_outlined,
                ),
                const KHeight(
                  size: 0.02,
                ),
                TextFormWidget(
                  textController: emailController,
                  hintText: "Enter your Phone",
                  prefixIcon: Icons.phone_outlined,
                ),
                const KHeight(
                  size: 0.02,
                ),
                TextFormWidget(
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Password is Incorrect";
                    } else {
                      return null;
                    }
                  },
                  textController: passwordController,
                  hintText: "Enter Password",
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: Icons.visibility_off_outlined,
                ),
                const KHeight(
                  size: 0.02,
                ),
                TextFormWidget(
                  validator: (value) {
                    if (value != passwordController.text) {
                      return "Password is Incorrect";
                    } else {
                      return null;
                    }
                  },
                  textController: confirmpasswordController,
                  hintText: "Confirm Password",
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: Icons.visibility_off_outlined,
                ),
                const KHeight(
                  size: 0.02,
                ),
                ElevatedButtonWidget(
                  text: "Register",
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
                  size: 0.01,
                ),
                // const Text(
                //   "or sign in with",
                //   style: TextStyle(
                //       // color: twhitecolor,
                //       ),
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     FloatingActionButton(
                //       backgroundColor: whiteColor,
                //       onPressed: () {},
                //       child: Image.asset(
                //         "assets/images/google.jpg",
                //         fit: BoxFit.contain,
                //         height: 40,
                //         width: 40,
                //       ),
                //     ),
                //     const KWidth(size: 0.04),
                //     FloatingActionButton(
                //       backgroundColor: whiteColor,
                //       onPressed: () {},
                //       child: Image.asset(
                //         "assets/images/facebook logo.png",
                //         fit: BoxFit.contain,
                //         height: 62,
                //         width: 62,
                //       ),
                //     ),
                //   ],
                // ),
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
