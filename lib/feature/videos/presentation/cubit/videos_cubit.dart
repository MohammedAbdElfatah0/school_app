import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/feature/videos/data/repo/video_repo.dart';

import '../../data/model/video_model.dart';

part 'videos_state.dart';

class VideosCubit extends Cubit<VideosState> {
  VideosCubit(this.videoRepo) : super(VideosInitial());

  final VideoRepo videoRepo;

  Future<Either<String, List<VideoModel>>> getVideos({
    required String courseId,
  }) async {
    emit(VideosLoading());
    final result = await videoRepo.getVideos(courseId: courseId);
    return result.fold(
      (l) {
        emit(VideosError(message: l));
        return left(l);
      },
      (r) {
        emit(VideosSuccess(videos: r));
        return right(r);
      },
    );
  }
}
