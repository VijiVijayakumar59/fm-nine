import 'package:flutter/material.dart';
import 'package:fmnine/presentation/news/widgets/video_play_widget.dart';

class ShortNews extends StatelessWidget {
  const ShortNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(10, (index) {
          return VideoPlayWidget(
            index: index,
          );
        }),
      )),
    );
  }
}
