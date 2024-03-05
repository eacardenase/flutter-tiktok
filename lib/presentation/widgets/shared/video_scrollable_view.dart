import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/presentation/widgets/shared/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: videos.length,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final videoPost = videos[index];

        return Stack(
          children: [
            // Video Player > Gradient
            // Buttons
            Positioned(
              right: 20,
              bottom: 40,
              child: VideoButtons(video: videoPost),
            ),
          ],
        );
      },
    );
  }
}
