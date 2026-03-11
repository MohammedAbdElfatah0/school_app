import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/widget/custom_loadint_widget.dart';
import 'package:school_app/feature/course/data/repo/course_repo.dart';
import 'package:school_app/feature/course/presentation/cubit/course_cubit.dart';

import '../../../../core/theme/text_style.dart';
import '../widget/list_view_builder_widget.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseCubit(CourseRepo())..getAllEnrollCourses(),
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          title: const Text('My Courses'),
          centerTitle: true,
        ),
        body: BlocBuilder<CourseCubit, CourseState>(
          builder: (context, state) {
            switch (state) {
              case CourseInitial():
                return const Center(child: CustomLoadingWidget());
              case CourseLoading():
                return const Center(child: CustomLoadingWidget());
              case CourseSuccess():
                if (state.courses.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.my_library_books, size: 56),
                        Text('No courses found', style: TextStyleApp.s16w700),
                      ],
                    ),
                  );
                }
                return ListViewBuilderWidget(course: state.courses);
              case CourseError():
                return const Center(
                  child: Text(
                    'Failed to load courses',
                    style: TextStyleApp.s16w700,
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
