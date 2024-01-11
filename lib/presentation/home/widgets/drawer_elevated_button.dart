import 'package:flutter/material.dart';

class DrawerElevatedButton extends StatelessWidget {
  final String text;
  const DrawerElevatedButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
