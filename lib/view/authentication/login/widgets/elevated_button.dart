import 'package:flutter/material.dart';
import 'package:fmnine/core/colors/colors.dart';

// ignore: must_be_immutable
class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final Color bgColor;

  final Color? textColor;
  void Function()? onPress;
  ElevatedButtonWidget({
    super.key,
    required this.text,
    this.textColor,
    required this.bgColor,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: whiteColor,
        backgroundColor: bgColor,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: bgColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onPressed: onPress!,
      child: Text(
        text,
      ),
    );
  }
}
