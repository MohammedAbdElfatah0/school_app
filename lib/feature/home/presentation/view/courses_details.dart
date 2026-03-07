import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:school_app/core/constants/color_manager.dart';
import 'package:school_app/core/theme/text_style.dart';
import 'package:school_app/feature/auth/presentation/widget/custom_button.dart';
import 'package:school_app/feature/home/data/model/courses_model.dart';

import '../../../../core/widget/custom_loadint_widget.dart';

class CoursesDetailsScreen extends StatelessWidget {
  const CoursesDetailsScreen({super.key, required this.course});

  final CoursesModel course;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                    placeholder: (context, url) => const CustomLoadingWidget(),
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: CustomButton(title: 'Start Course', onPressed: () {}),
            ),
          ],
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
