import 'package:tiktok/domain/entities/video_post.dart';

abstract class VideoPostDatasource {
  Future<List<VideoPost>> getTrendingVideosByPage(int page);

  Future<List<VideoPost>> getFavoriteVideosByUser(String userId);
}
