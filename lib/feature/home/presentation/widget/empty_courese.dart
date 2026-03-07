
import 'package:flutter/material.dart';

import '../../../../core/constants/color_manager.dart';
import '../../../../core/theme/text_style.dart';

class EmptyCourses extends StatelessWidget {
  const EmptyCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.school_outlined,
            size: 80,
            color: ColorManager.greyColor500,
          ),
          const SizedBox(height: 16),
          Text(
            'No courses available',
            style: TextStyleApp.s16w600.copyWith(
              color: ColorManager.greyColor500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Check back later for new courses',
            style: TextStyleApp.s14w400.copyWith(
              color: ColorManager.greyColor500,
            ),
          ),
        ],
      ),
    );
  }
}
