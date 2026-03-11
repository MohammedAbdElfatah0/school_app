import 'package:dartz/dartz.dart';
import 'package:school_app/core/networks/supabase_service.dart';
import 'package:school_app/feature/videos/data/model/video_model.dart';

class VideoRepo {
  final sup = SupabaseService.instance.client;

  Future<Either<String, List<VideoModel>>> getVideos({
    required String courseId,
  }) async {
    try {
      final response = await sup
          .from('videos')
          .select()
          .eq('course_id', courseId);
      final listVideos = response.map((e) => VideoModel.fromJson(e)).toList();
      return right(listVideos);
    } catch (e) {
      return left(e.toString());
    }
  }
}
