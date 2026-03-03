import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_icon_button.dart';

class SocialAuthButtons extends StatelessWidget {
  const SocialAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(icon: FontAwesomeIcons.google, onPressed: () {}),
        const SizedBox(width: 16),
        CustomIconButton(icon: FontAwesomeIcons.facebook, onPressed: () {}),
        const SizedBox(width: 16),
        CustomIconButton(icon: FontAwesomeIcons.apple, onPressed: () {}),
      ],
    );
  }
}
