import 'package:flutter/material.dart';
import 'package:school_app/core/constants/color_manager.dart';
import 'package:school_app/core/theme/text_style.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: ColorManager.whiteColor, width: 2),
    );
    return Container(
      decoration: const BoxDecoration(color: ColorManager.primaryColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, $name',
              style: TextStyleApp.s16w700.copyWith(
                color: ColorManager.whiteColor,
              ),
            ),
            Text(
              'Welcome to School',
              style: TextStyleApp.s18w600.copyWith(
                color: ColorManager.whiteColor,
              ),
            ),
            TextField(
              style: const TextStyle(color: ColorManager.blackColor),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: ColorManager.greyColor500,
                ),
                hintText: 'What are you looking for?',
                filled: true,
                fillColor: ColorManager.whiteColor,
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          ],
        ),
      ),
    );
  }
}
