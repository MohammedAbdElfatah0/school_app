part of 'home_cubit.dart';

sealed class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<CoursesModel> courses;
  HomeSuccessState(this.courses);
}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState(this.message);
}
