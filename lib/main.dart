import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:tiktok/config/theme/app_theme.dart';
import 'package:tiktok/infrastructure/datasources/local_videos_datasource_impl.dart';
import 'package:tiktok/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:tiktok/presentation/providers/discover_provider.dart';
import 'package:tiktok/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostsReposotory = VideoPostsReposotoryImpl(
      videosDataSource: LocalVideosDatasource(),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) {
            return DiscoverProvider(
              videosRepository: videoPostsReposotory,
            )..loadNextPage();
          }, // cascade operator allows to make a sequence of operations on the same object
        ),
      ],
      child: MaterialApp(
        title: 'Tiktok',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
