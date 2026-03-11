import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:school_app/core/theme/text_style.dart';
import 'package:school_app/core/widget/custom_loadint_widget.dart';
import 'package:school_app/feature/videos/data/model/video_model.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {
  const PlayVideo({super.key, required this.video});
  final VideoModel video;

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
          Uri.parse(widget.video.videoUrl),
        )
        ..initialize().then((onValue) {
          setState(() {});
        }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = flickManager.flickVideoManager?.videoPlayerController;
    return Scaffold(
      body:
          controller == null
              ? const CustomLoadingWidget()
              : controller.value.hasError
              ? const Center(child: Text('Error loading video'))
              : !controller.value.isInitialized
              ? const CustomLoadingWidget()
              : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: FlickVideoPlayer(flickManager: flickManager),
                  ),
                  const SizedBox(height: 16),
                  Text(widget.video.title, style: TextStyleApp.s24w600),
                ],
              ),
    );
  }
}
