import 'package:flutter/material.dart';
import 'package:school_app/core/theme/text_style.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyleApp.s14w600,);
  }
}