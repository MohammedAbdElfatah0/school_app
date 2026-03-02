import 'package:flutter/material.dart';
import 'package:school_app/core/constants/color_manager.dart';
import 'package:school_app/core/theme/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primaryColor,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width *0.37 ,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
      child: Text(title, style: TextStyleApp.s18w600.copyWith(color: ColorManager.whiteColor)),
    );
  }
}
