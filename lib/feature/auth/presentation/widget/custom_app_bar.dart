import 'package:flutter/material.dart';
import 'package:school_app/core/constants/color_manager.dart';

import '../../../../core/theme/text_style.dart';

class CustomAppBarAuth extends StatelessWidget {
  const CustomAppBarAuth({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.25,
      decoration: const BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
          bottomRight: Radius.circular(80),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 25,
          children: [
            Text(
              'School App',
              style: TextStyleApp.s30w700.copyWith(
                color: ColorManager.secondaryColor,
              ),
            ),
            Text(
              title,
              style: TextStyleApp.s30w700.copyWith(
                color: ColorManager.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
