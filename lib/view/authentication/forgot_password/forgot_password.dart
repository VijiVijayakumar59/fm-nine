// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fmnine/core/constants/constants.dart';
import 'package:fmnine/view/authentication/login/widgets/elevated_button.dart';
import 'package:fmnine/view/authentication/login/widgets/textform_widget.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reset Password",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormWidget(
              hintText: "Enter your email",
              textController: emailController,
              prefixIcon: Icons.email_outlined,
            ),
            const KHeight(
              size: 0.01,
            ),
            ElevatedButtonWidget(
              text: "Reset Password",
              bgColor: Colors.red,
              onPress: () {},
            ),
            //need an snackbar to show the details send it to the mail
          ],
        ),
      ),
    ));
  }
}
