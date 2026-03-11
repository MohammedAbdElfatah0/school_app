import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:school_app/core/networks/supabase_service.dart';
import 'package:school_app/feature/home/data/model/courses_model.dart';

class CourseRepo {
  final sup = SupabaseService.instance.client;

  String get userID => sup.auth.currentUser!.id;
  Future<Either<String, List<CoursesModel>>> getMyCourse() async {
    try {
      log('trying to get my course');
      final res = await sup
          .from('enroll')
          .select('courses(*)')
          .eq('user_id', userID);

      final coursesList = res.map((e) => e['courses']).toList();
      final courses =
          coursesList
              .map((courseData) => CoursesModel.fromJson(courseData))
              .toList();
      return Right(courses);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
