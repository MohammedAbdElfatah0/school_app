import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/feature/course/presentation/view/course_screen.dart';
import 'package:school_app/feature/home/presentation/view/home_screen.dart';
import 'package:school_app/feature/profile/presentation/view/profile_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(InitLayoutState());

  int currentIndex = 0;
  List<Widget> screen = const [HomeScreen(), CourseScreen(), ProfileScreen()];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeLayoutState());
  }
}
