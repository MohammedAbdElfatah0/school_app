import 'package:flutter/material.dart';
import 'package:school_app/core/constants/color_manager.dart';
import 'package:school_app/core/theme/text_style.dart';
import 'package:school_app/feature/auth/validator/validators.dart';

import '../../../../core/widget/custom_text_form_field.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_button.dart';
import '../widget/socail_auth_buttons.dart';
import '../widget/divieder_contnue.dart';
import '../widget/header_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBarAuth(title: "Login"),
              Form(
                key: formKey,
                child: _buildLoginForm(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildLoginForm({
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 40.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderText(title: 'Email'),
        const SizedBox(height: 8),
        CustomTextFormField(
          controller: emailController,
          hintText: "enter your email",
          prefix:   Icon(
            Icons.email_outlined,
            color: ColorManager.primaryColor.withAlpha(100),
          ),
          validator: Validators.email,
        ),
        const SizedBox(height: 16),
        const HeaderText(title: 'Password'),
        const SizedBox(height: 8),
        CustomTextFormField(
          controller: passwordController,
          hintText: "enter your password",
          prefix: Icon(
            Icons.lock_outline,
            color: ColorManager.primaryColor.withAlpha(100),
          ),
          validator: Validators.password,
          isPassword: true,
        ),

        const SizedBox(height: 20),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            'forgot password?',
            style: TextStyleApp.s14w500.copyWith(
              color: ColorManager.greyColor500,
            ),
          ),
        ),
        const SizedBox(height: 30),
        CustomButton(title: 'Login', onPressed: () {}),
        const SizedBox(height: 20),
        const DiviederContinue(),
        const SizedBox(height: 32),
        const SocialAuthButtons(),
        const SizedBox(height: 90),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: TextStyleApp.s14w500.copyWith(
                color: ColorManager.greyColor500,
              ),
            ),
            Text(
              'Sign Up',
              style: TextStyleApp.s14w500.copyWith(
                color: ColorManager.primaryColor,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
