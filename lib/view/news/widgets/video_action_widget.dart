import 'package:flutter/material.dart';
import 'package:fmnine/core/colors/colors.dart';

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: whiteColor,
          size: 30,
        ),
        Text(
          title,
          style: const TextStyle(
            color: whiteColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
