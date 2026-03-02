import 'package:flutter/material.dart';

import '../widget/custom_app_bar.dart';
import '../widget/header_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBarAuth(title: "Login",),
          
          HeaderText(title :"Email"),
          
          HeaderText(title :"Password"),
        ],
      ),
    );
  }
}
