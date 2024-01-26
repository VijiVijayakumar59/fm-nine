// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:fmnine/models/services/reel_services/reel_services.dart';
import 'package:fmnine/view/news/widgets/video_play_widget.dart';

class VideoReelPage extends StatefulWidget {
  const VideoReelPage({Key? key, required this.reels, required this.onLoadMore})
      : super(key: key);

  final List<Video> reels;
  final VoidCallback onLoadMore;

  @override
  _VideoReelPageState createState() => _VideoReelPageState();
}

class _VideoReelPageState extends State<VideoReelPage> {
  late PageController _pageController;
  int currentPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void _handlePageChanged(int index) {
    currentPage = index;

    // Load more reels when reaching the last item on the page
    if (index == widget.reels.length && !isLoading) {
      _loadReels();
    }
  }

  void _loadReels() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      widget.onLoadMore(); // Now you can await onLoadMore

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: widget.reels.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              itemCount: widget.reels.length,
              onPageChanged: _handlePageChanged,
              itemBuilder: (context, index) {
                return VideoPlayerWidget(
                  key: Key(widget.reels[index].videoUrl),
                  reelUrl: widget.reels[index].videoUrl,
                  newsHeadline: widget.reels[index].videoTitle,
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
