part of "course_cubit.dart";

sealed class CourseDetailsState {}

final class CourseDetailsInitial extends CourseDetailsState {}

final class CourseDetailsLoading extends CourseDetailsState {}

final class CourseDetailsSuccess extends CourseDetailsState {}

final class CourseDetailsError extends CourseDetailsState {
  final String message;
  CourseDetailsError(this.message);
}

///enroll
class AleadyEnrolledState extends CourseDetailsState {}

class NotEnrolledState extends CourseDetailsState {}
