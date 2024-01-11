import 'package:flutter/material.dart';
import 'package:fmnine/core/constants/constants.dart';
import 'package:fmnine/presentation/news/widgets/video_action_widget.dart';

class VideoPlayWidget extends StatelessWidget {
  final int index;
  const VideoPlayWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                // CircleAvatar(
                //   radius: 30,
                //   backgroundColor: Colors.black.withOpacity(0.5),
                //   child: IconButton(
                //     onPressed: () {},
                //     icon: const Icon(
                //       Icons.volume_off,
                //       color: whiteColor,
                //       size: 30,
                //     ),
                //   ),
                // ),
                Text(
                  "News Headline",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                //right side
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VideoActionsWidget(
                        icon: Icons.favorite_border,
                        title: 'Like',
                      ),
                      KHeight(size: 0.016),
                      VideoActionsWidget(
                          icon: Icons.share_outlined, title: 'Share'),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
