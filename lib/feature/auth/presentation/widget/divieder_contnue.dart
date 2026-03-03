import 'package:flutter/material.dart';

import '../../../../core/constants/color_manager.dart';
import '../../../../core/theme/text_style.dart';

class DiviederContinue extends StatelessWidget {
  const DiviederContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: Colors.black, thickness: 1, endIndent: 5),
        ),
        Text(
          'or continue with',
          style: TextStyleApp.s16w700.copyWith(color: ColorManager.blackColor),
        ),
        const Expanded(
          child: Divider(color: Colors.black, thickness: 1, indent: 5),
        ),
      ],
    );
  }
}
