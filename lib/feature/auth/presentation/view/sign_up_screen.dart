import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/constants/color_manager.dart';
import 'package:school_app/core/theme/text_style.dart';
import 'package:school_app/feature/auth/presentation/cubit/signup/sign_up_cubit.dart';
import 'package:school_app/feature/auth/validator/validators.dart';

import '../../../../core/networks/supabase_service.dart';
import '../../../../core/widget/custom_text_form_field.dart';
import '../../../../core/widget/snack_bar.dart';
import '../../data/repos/auth_repo.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_button.dart';
import '../widget/socail_auth_buttons.dart';
import '../widget/divieder_contnue.dart';
import '../widget/header_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
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
    return BlocProvider<SignUpCubit>(
      create: (BuildContext context) {
        return SignUpCubit(AuthRepo(SupabaseService.instance.client));
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBarAuth(title: "Sign Up"),
                Form(
                  key: formKey,
                  child: _buildSignUpForm(
                    context: context,
                    fullNameController: fullNameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<SignUpCubit>(context).signUp(
                          fullName: fullNameController.text,
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
      ),
    );
  }
}

Widget _buildSignUpForm({
  required BuildContext context,
  required TextEditingController fullNameController,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required VoidCallback onPressed,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 40.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderText(title: 'Full Name'),
        const SizedBox(height: 8),
        CustomTextFormField(
          controller: fullNameController,
          hintText: "enter your full name",
          prefix: Icon(
            Icons.person_outline,
            color: ColorManager.primaryColor.withAlpha(100),
          ),
          validator: Validators.fullName,
        ),
        const SizedBox(height: 16),
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

        const SizedBox(height: 30),
        BlocConsumer<SignUpCubit, SignUpStatus>(
          listener: (context, state) {
            if (state is SignUpSuccessState) {
              log("success sign up");
              //TODO Navigator.pushReplacementNamed(context, Routes.homeRoute);
            }

            if (state is SignUpFailureState) {
              SnackBarMessage().show(
                context,
                message: state.errorMessage,
                color: ColorManager.errorColor,
              );
            }
          },
          builder: (context, state) {
            return state is SignUpLoadingState
                ? const CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                  backgroundColor: ColorManager.secondaryColor,
                )
                : CustomButton(title: 'Sign Up', onPressed: onPressed);
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
                Navigator.pop(context);
              },
              child: Text(
                'Login',
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
