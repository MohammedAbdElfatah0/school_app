part of 'course_cubit.dart';

sealed class CourseState {}

final class CourseInitial extends CourseState {}

final class CourseLoading extends CourseState {}

final class CourseSuccess extends CourseState {
  final List<CoursesModel> courses;

  CourseSuccess(this.courses);
}

final class CourseError extends CourseState {
  final String message;

  CourseError(this.message);
}