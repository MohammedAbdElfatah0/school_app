import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/constants/color_manager.dart';
import 'package:school_app/core/theme/text_style.dart';
import 'package:school_app/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:school_app/feature/auth/validator/validators.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/widget/custom_text_form_field.dart';
import '../../../../core/widget/snack_bar.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_button.dart';
import '../widget/divieder_contnue.dart';
import '../widget/header_text.dart';
import '../widget/socail_auth_buttons.dart';

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
                  context: context,
                  emailController: emailController,
                  passwordController: passwordController,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context).login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    } else {
                      SnackBarMessage().show(
                        context,
                        message: "Please fill all fields correctly",
                        color: ColorManager.errorColor,
                      );
                    }
                  },
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
  required BuildContext context,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required VoidCallback onPressed,
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
          prefix: Icon(
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
        BlocConsumer<LoginCubit, LoginStatus>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.pushReplacementNamed(context, Routes.layout);
            }

            if (state is LoginFailureState) {
              SnackBarMessage().show(
                context,
                message: state.errorMessage,
                color: ColorManager.errorColor,
              );
            }
          },
          builder: (context, state) {
            return state is LoginLoadingState
                ? const Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primaryColor,
                    backgroundColor: ColorManager.secondaryColor,
                  ),
                )
                : CustomButton(title: 'Login', onPressed: onPressed);
          },
        ),
        const SizedBox(height: 20),
        const DiviederContinue(),
        const SizedBox(height: 32),
        const SocialAuthButtons(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: TextStyleApp.s14w500.copyWith(
                color: ColorManager.greyColor500,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.signUpRoute);
              },
              child: Text(
                'Sign Up',
                style: TextStyleApp.s14w500.copyWith(
                  color: ColorManager.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
