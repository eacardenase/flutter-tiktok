import 'package:flutter/material.dart';

import 'package:tiktok/domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  var initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    // TODO: load videos

    notifyListeners();
  }
}
