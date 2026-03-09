import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/constants/color_manager.dart';
import 'package:school_app/core/networks/supabase_service.dart';
import 'package:school_app/core/theme/text_style.dart';
import 'package:school_app/feature/home/data/model/courses_model.dart';

import '../../../../core/widget/custom_loadint_widget.dart';
import '../../data/repo/course_details_repo.dart';
import '../cubit/course_cubit.dart';
import '../widget/button_course_details.dart';

class CoursesDetailsScreen extends StatelessWidget {
  const CoursesDetailsScreen({super.key, required this.course});

  final CoursesModel course;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => CourseDetailsCubit(CourseDetailsRepo())..checkEnrollment(
            userId: SupabaseService.instance.client.auth.currentUser!.id,
            courseId: course.id,
          ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
            centerTitle: true,
            title: Text(
              'Course Details',

              style: TextStyleApp.s20w700.copyWith(
                color: ColorManager.primaryColor,
              ),
            ),
          ),

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// IMAGE
              Hero(
                tag: course.id,
                child: Card(
                  margin: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: course.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
                      placeholder:
                          (context, url) => const CustomLoadingWidget(),
                    ),
                  ),
                ),
              ),

              /// SCROLLABLE CONTENT
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _info(course),
                ),
              ),

              /// BUTTON FIXED AT BOTTOM
              ButtonCourseDetails(
                courseID: course.id,
                userID: SupabaseService.instance.client.auth.currentUser!.id,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _info(CoursesModel course) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title Course:\t${course.title}',
          style: TextStyleApp.s24w600.copyWith(color: ColorManager.blackColor),
        ),

        const SizedBox(height: 16),

        Text(
          'Price:\t${course.price} EGP',
          style: TextStyleApp.s20w700.copyWith(color: ColorManager.greenColor),
        ),

        const SizedBox(height: 20),

        Text(
          'Description',
          style: TextStyleApp.s18w700.copyWith(color: ColorManager.blackColor),
        ),
        const SizedBox(height: 8),
        Text(
          course.description,
          style: TextStyleApp.s16w400.copyWith(
            color: ColorManager.greyColor500,
          ),
        ),
      ],
    );
  }
}
