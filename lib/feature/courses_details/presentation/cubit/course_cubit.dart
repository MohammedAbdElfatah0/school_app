import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/feature/courses_details/data/repo/course_details_repo.dart';

part 'course_state.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  CourseDetailsCubit(this._repository) : super(CourseDetailsInitial());
  final CourseDetailsRepo _repository;

  Future<void> enrollCourse({
    required String userId,
    required String courseId,
  }) async {
    emit(CourseDetailsLoading());

    final result = await _repository.enrollCourse(
      courseID: courseId,
      userID: userId,
    );
    result.fold(
      (l) => emit(CourseDetailsError(l)),
      (r) => emit(CourseDetailsSuccess()),
    );
  }

  checkEnrollment({required String userId, required String courseId}) async {
    final result = await _repository.checkEnrollCourse(
      courseID: courseId,
      userID: userId,
    );
    result.fold(
      (l) => emit(CourseDetailsError(l)),
      (r) => emit(r ? AleadyEnrolledState() : NotEnrolledState()),
    );
  }
}
