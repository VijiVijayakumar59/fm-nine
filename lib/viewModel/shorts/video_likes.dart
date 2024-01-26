// Create a new Dart file, e.g., liked_videos_provider.dart

import 'package:flutter/material.dart';

class LikedVideosProvider extends ChangeNotifier {
  final Set<String> _likedVideoIds = {};

  Set<String> get likedVideoIds => _likedVideoIds;

  void toggleLike(String videoId) {
    if (_likedVideoIds.contains(videoId)) {
      _likedVideoIds.remove(videoId);
    } else {
      _likedVideoIds.add(videoId);
    }

    notifyListeners();
  }

  bool isVideoLiked(String videoId) {
    return _likedVideoIds.contains(videoId);
  }
}
