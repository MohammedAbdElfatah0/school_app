import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/widget/custom_loadint_widget.dart';
import 'package:school_app/feature/videos/data/repo/video_repo.dart';
import 'package:school_app/feature/videos/presentation/cubit/videos_cubit.dart';

import '../widget/list_view_builder_video_widget.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courseId = ModalRoute.of(context)?.settings.arguments;
    // log(args.toString());
    return BlocProvider(
      create:
          (context) =>
              VideosCubit(VideoRepo())..getVideos(courseId: courseId as String),
      child: Scaffold(
        appBar: AppBar(title: const Text('Videos')),
        body: BlocBuilder<VideosCubit, VideosState>(
          builder: (context, state) {
            switch (state) {
              case VideosInitial():
                return const Center(child: Text('Initial'));
              case VideosLoading():
                return const CustomLoadingWidget();
              case VideosSuccess():
                if (state.videos.isEmpty) {
                  return const Center(child: Text('No videos found'));
                }
                return ListViewBuilderVideoWidget(videos: state.videos);
              case VideosError():
                return Center(child: Text(state.message));
            }
          },
        ),
      ),
    );
  }
}
