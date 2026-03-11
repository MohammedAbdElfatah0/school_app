import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/feature/course/data/repo/course_repo.dart';
import 'package:school_app/feature/home/data/model/courses_model.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit(this._courseRepo) : super(CourseInitial());

  final CourseRepo _courseRepo;

  //get all enroll courses
  Future<void> getAllEnrollCourses() async {
    emit(CourseLoading());
    final result = await _courseRepo.getMyCourse();
    result.fold((l) => emit(CourseError(l)), (r) => emit(CourseSuccess(r)));
  }
}
