import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/constants/color_manager.dart';
import 'package:school_app/core/theme/text_style.dart';
import 'package:school_app/feature/home/presentation/cubit/home_cubit.dart';

import '../../../../core/widget/custom_loadint_widget.dart';
import 'build_courses_grid.dart';
import 'empty_courese.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state) {
          case HomeInitialState():
            return const SizedBox();
          case HomeLoadingState():
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.78,
              child: const CustomLoadingWidget(),
            );
          case HomeSuccessState():
            if (state.courses.isEmpty) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: const Center(child: EmptyCourses()),
              );
            }
            return BuildCoursesGrid(courses: state.courses);
          case HomeErrorState():
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.78,
              child: Center(
                child: Text(
                  'Error loading courses',
                  style: TextStyleApp.s16w600.copyWith(
                    color: ColorManager.errorColor,
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
