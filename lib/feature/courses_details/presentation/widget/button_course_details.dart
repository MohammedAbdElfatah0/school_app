import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/color_manager.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/snack_bar.dart';
import '../cubit/course_cubit.dart';

class ButtonCourseDetails extends StatelessWidget {
  const ButtonCourseDetails({
    super.key,
    required this.userID,
    required this.courseID,
  });
  final String userID;
  final String courseID;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseDetailsCubit, CourseDetailsState>(
      listener: (context, state) {
        if (state is CourseDetailsError) {
          SnackBarMessage().show(
            context,
            message: state.message,
            color: ColorManager.errorColor,
          );
        }
        if (state is CourseDetailsSuccess) {
          SnackBarMessage().show(
            context,
            message: 'Course enrolled successfully',
            color: ColorManager.greenColor,
          );
        }
      },
      builder: (context, state) {
        return state is CourseDetailsInitial
            ? const SizedBox()
            : Padding(
              padding: const EdgeInsets.all(16),
              child: CustomButton(
                title:
                    // state is NotEnrolledState ||
                    //         state is CourseDetailsInitial ||
                    //         state is CourseDetailsError
                    state is AleadyEnrolledState ||
                            state is CourseDetailsSuccess
                        ? 'Enrolled'
                        : 'Enroll Course',
                onPressed: () {
                  if (state is NotEnrolledState ||
                      state is CourseDetailsInitial ||
                      state is CourseDetailsError) {
                    context.read<CourseDetailsCubit>().enrollCourse(
                      userId: userID,
                      courseId: courseID,
                    );
                  }
                  //todo show start videos
                },
              ),
            );
      },
    );
  }
}
