import 'package:flutter/material.dart';
import 'package:fmnine/core/colors/colors.dart';

class TextFormWidget extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController textController;
  const TextFormWidget({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          fillColor: whiteColor,
          contentPadding: const EdgeInsets.all(8),
          prefixIcon: Icon(
            prefixIcon,
          ),
          suffixIcon: Icon(
            suffixIcon,
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(
              22,
            ),
          ),
        ),
      ),
    );
  }
}

class EmailPhoneTextWidget extends StatelessWidget {
  final List<TextEditingController> textControllers;
  final String hintText;
  final IconData prefixIcon;

  const EmailPhoneTextWidget({
    super.key,
    required this.textControllers,
    required this.hintText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: TextFormField(
        controller: textControllers[0],
        decoration: InputDecoration(
          fillColor: whiteColor,
          contentPadding: const EdgeInsets.all(8),
          prefixIcon: Icon(
            prefixIcon,
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(
              22,
            ),
          ),
        ),
      ),
    );
  }
}
