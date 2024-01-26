// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fmnine/models/services/reel_services/cache_config.dart';
import 'package:fmnine/models/services/reel_services/reel_services.dart';
import 'package:fmnine/viewModel/shorts/video_likes.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String reelUrl;
  final String newsHeadline;
  final String videoId;
  const VideoPlayerWidget({
    Key? key,
    required this.reelUrl,
    required this.newsHeadline,
    required this.videoId,
  }) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget>
    with WidgetsBindingObserver {
  late VideoPlayerController _controller;
  bool _videoInitialized = false;
  bool _isPlaying = false;
  bool _isMounted = false;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _isMounted = true;
    initializeController();
    isLiked = Provider.of<LikedVideosProvider>(context, listen: false)
        .isVideoLiked(widget.reelUrl);
  }

  Future<void> initializeController() async {
    var fileInfo = await kCacheManager.getFileFromCache(widget.reelUrl);
    if (fileInfo == null) {
      await kCacheManager.downloadFile(widget.reelUrl);
      fileInfo = await kCacheManager.getFileFromCache(widget.reelUrl);
    }
    if (_isMounted && fileInfo != null) {
      _controller = VideoPlayerController.file(fileInfo.file);
      await _controller.initialize();
      _controller.addListener(() {
        if (_controller.value.isPlaying && !_isPlaying) {
          // Video has started playing
          if (_isMounted) {
            setState(() {
              _isPlaying = true;
            });
          }
        }
      });

      if (_isMounted) {
        setState(() {
          _controller.setLooping(true); // Set video to loop
          _controller.play();
          _videoInitialized = true;
        });
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (_isMounted && _videoInitialized) {
      if (state == AppLifecycleState.resumed) {
        // App is in the foreground
        _controller.play();
      } else if (state == AppLifecycleState.inactive) {
        // App is partially obscured
        _controller.pause();
      } else if (state == AppLifecycleState.paused) {
        // App is in the background
        _controller.pause();
      } else if (state == AppLifecycleState.detached) {
        // App is terminated
        _disposeController(); // Dispose of the controller
      }
    }
  }

  @override
  void dispose() {
    log('disposing a controller');
    _isMounted = false;
    _disposeController(); // Dispose of the controller when done
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // Explicitly pause and dispose of the controller
  void _disposeController() {
    if (_videoInitialized) {
      _controller.pause();
      _controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_videoInitialized) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.amber,
        ),
      );
    }

    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: GestureDetector(
        onTap: () {
          if (_isMounted && _videoInitialized) {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
                _isPlaying = false;
              } else {
                _controller.play();
                _isPlaying = true;
              }
            });
          }
        },
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            VideoPlayer(_controller),
            if (!_isPlaying && _isMounted)
              const Center(
                child: Icon(
                  Icons.play_arrow,
                  size: 50.0,
                  color: Colors.white,
                ),
              ),
            Positioned(
              top: 600.0, // Adjust the top position as needed
              left: 16.0, // Adjust the left position as needed
              child: Text(
                widget.newsHeadline,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 4.0, // Adjust the bottom position as needed
              right: 16.0, // Adjust the right position as needed
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.white,
                    ),
                    onPressed: () {
                      final likedVideosProvider =
                          Provider.of<LikedVideosProvider>(context,
                              listen: false);
                      likedVideosProvider.toggleLike(widget.reelUrl);
                      setState(() {
                        isLiked =
                            likedVideosProvider.isVideoLiked(widget.reelUrl);
                      });
                      if (_isMounted && _videoInitialized) {
                        ReelService reelService = ReelService(
                          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NWIzNjYyNmVjMjdmZGY2NTk0NDA5NjAiLCJyb2xlIjoiVXNlciIsImlhdCI6MTcwNjI1NTk2MSwiZXhwIjoxNzA2Njg3OTYxfQ.N4w9CS7UZNtBWKAKIM2zC25-GPYp5RzWMevnHoxUGtk",
                        );
                        String videoId = widget.videoId;
                        // Call the likeVideo method and update the like status
                        reelService.likeVideo(videoId).then((_) {
                          setState(() {
                            isLiked = !isLiked;
                          });
                        });
                      }
                    },
                    color: Colors.white,
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      // Handle share button press
                    },
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
              colors: const VideoProgressColors(
                playedColor: Colors.amber,
                bufferedColor: Colors.grey,
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
