import 'package:flutter/material.dart';

import '../widget/custom_app_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBarAuth(title: "Login",),
          // Add your login form here
        ],
      ),
    );
  }
}
