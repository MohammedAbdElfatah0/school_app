import 'package:dartz/dartz.dart';
import 'package:school_app/core/networks/supabase_service.dart';
import 'package:school_app/feature/home/data/model/courses_model.dart';

class HomeRepo {
  Future<Either<String, List<CoursesModel>>> getCourses() async {
    try {
      final response =
          await SupabaseService.instance.client.from('courses').select();
      final List<CoursesModel> courses =
          response.map((e) => CoursesModel.fromJson(e)).toList();
      return Right(courses);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}
