// ignore_for_file: prefer_const_declarations

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Video {
  final String videoUrl;
  final String videoTitle;

  Video(this.videoUrl, this.videoTitle);
}

class ReelService {
  final List<Video> _reels = [];
  int _currentPage = 1;
  String _authToken; // Store the authentication token

  ReelService(this._authToken);

  void setAuthToken(String authToken) {
    _authToken = authToken;
  }

  final baseUrl = 'https://fm9-malayalam.onrender.com/api';

  Future<List<Video>> getVideosFromApi() async {
    final response = await http.get(
      Uri.parse('$baseUrl/short-videos?page=$_currentPage'),
      headers: {
        'Authorization': 'Bearer $_authToken',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      if (jsonResponse['status'] == 'success') {
        final List<dynamic> shortVideos = jsonResponse['shortVideos'];
        final List<Video> videos = shortVideos.map((video) {
          return Video(
            video['videoUrl'].toString(),
            video['videoTitle']
                .toString(), // Replace with the actual key for video title
          );
        }).toList();
        log(response.body.toString());
        log('Videos: $videos');
        _reels.addAll(videos);
        return videos;
      } else {
        log('Failed to load videos. Server returned an error: ${jsonResponse['message']}');
        throw Exception(
            'Failed to load videos. Server returned an error: ${jsonResponse['message']}');
      }
    } else {
      log('Failed to load videos. Status code: ${response.statusCode}');
      log('Response body: ${response.body}');
      throw Exception(
          'Failed to load videos. Status code: ${response.statusCode}, Response body: ${response.body}');
    }
  }

  Future<void> loadNextPage() async {
    _currentPage++;
    await getVideosFromApi(); // Make sure getVideosFromApi is awaited
  }

  List<Video> getReels() {
    return _reels;
  }

  Future<Map<String, Object>> likeVideo(String videoId) async {
    final likeUrl = '$baseUrl/short-video-like';

    final response = await http.post(
      Uri.parse(likeUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_authToken',
      },
      body: jsonEncode({
        'videoId': videoId,
      }),
    );
    log(response.body.toString());
    if (response.statusCode == 200) {
      log('Video liked successfully');
      log(response.body.toString());
      return {'success': true, 'message': 'Login successful'};
    } else {
      log('Failed to like video. Status code: ${response.statusCode}');
      log('Response body: ${response.body}');
      // Handle the error as needed
      throw Exception(
          'Failed to like video. Status code: ${response.statusCode}, Response body: ${response.body}');
    }
  }
}
