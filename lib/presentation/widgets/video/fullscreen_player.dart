import 'package:flutter/material.dart';
import 'package:tiktok/presentation/widgets/video/gradient_background.dart';

import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption,
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  void toggleVideoPlay() {
    setState(() {
      if (controller.value.isPlaying) {
        controller.pause();

        return;
      }

      controller.play();
    });
  }

  @override
  void initState() {
    super.initState(); // at the start of the funtion's body

    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose(); // at the end of the funtion's body
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }

        return GestureDetector(
          onTap: toggleVideoPlay,
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(
                  controller,
                ),
                // Gradient
                GradientBackground(
                  colors: const [
                    Colors.transparent,
                    Colors.black,
                  ],
                  stops: const [
                    0.8,
                    1.0,
                  ],
                ),
                Positioned(
                  bottom: 40,
                  left: 20,
                  child: _VideoCaption(
                    caption: widget.caption,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;

  const _VideoCaption({
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
