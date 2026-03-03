import 'package:flutter/material.dart';
import 'package:school_app/core/constants/color_manager.dart';
import 'package:school_app/core/theme/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, this.onPressed});
  final String title;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primaryColor,
          padding: EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          title,
          style: TextStyleApp.s18w600.copyWith(color: ColorManager.whiteColor),
        ),
      ),
    );
  }
}
