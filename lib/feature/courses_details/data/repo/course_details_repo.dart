import 'package:dartz/dartz.dart';
import 'package:school_app/core/networks/supabase_service.dart';

class CourseDetailsRepo {
  Future<Either<String, void>> enrollCourse({
    required String courseID,
    required String userID,
  }) async {
    try {
      final check =
          await SupabaseService.instance.client
              .from('enroll')
              .select()
              .eq('course_id', courseID)
              .eq('user_id', userID)
              .maybeSingle();
      if (check != null) {
        return left('You are already enrolled in this course');
      }

      await SupabaseService.instance.client.from('enroll').insert({
        'course_id': courseID,
        'user_id': userID,
      });
      // return right(response.data);
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, bool>> checkEnrollCourse({
    required String courseID,
    required String userID,
  }) async {
    try {
      final check =
          await SupabaseService.instance.client
              .from('enroll')
              .select()
              .eq('course_id', courseID)
              .eq('user_id', userID)
              .maybeSingle();
      return Right(check != null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
