import 'package:tiktok/domain/datasources/video_post_datasource.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/domain/repositories/video_post_repository.dart';

class VideoPostsReposotoryImpl extends VideoPostRepository {
  final VideoPostDatasource videosDataSource;

  VideoPostsReposotoryImpl({
    required this.videosDataSource,
  });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDataSource.getTrendingVideosByPage(page);
  }
}
