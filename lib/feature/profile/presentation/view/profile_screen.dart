import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/constants/color_manager.dart';
import 'package:school_app/core/theme/text_style.dart';
import 'package:school_app/core/widget/custom_loadint_widget.dart';
import 'package:school_app/feature/auth/presentation/cubit/login/login_cubit.dart';
import 'package:school_app/feature/profile/data/repo/profile_repo.dart';
import 'package:school_app/feature/profile/presentation/cubit/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(ProfileRepo())..getUserProfile(),
      child: const SafeArea(child: Scaffold(body: ProfileView())),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Future<void> _handleLogout(BuildContext context) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => const AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 16),
                Text('Logging out...'),
              ],
            ),
          ),
    );

    try {
      await context.read<LoginCubit>().logout();

      if (mounted) {
        Navigator.of(context).pop(); // Close loading dialog

        // Navigate to login screen (you may need to adjust this based on your app structure)
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/login', // Adjust route name as needed
          (route) => false,
        );
      }
    } catch (e) {
      if (mounted) {
        Navigator.of(context).pop(); // Close loading dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Logout failed: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoadingState) {
          return const CustomLoadingWidget();
        } else if (state is ProfileSuccessState) {
          return Center(
            child: SizedBox(
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Profile',
                        style: TextStyleApp.s30w700.copyWith(
                          color: ColorManager.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'name: ${state.user.fullName}',
                          style: TextStyleApp.s20w700.copyWith(
                            color: ColorManager.blackColor,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'email: ${state.user.email}',
                          style: TextStyleApp.s20w700.copyWith(
                            color: ColorManager.blackColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _handleLogout(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.primaryColor,
                            foregroundColor: ColorManager.whiteColor,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text('Logout', style: TextStyleApp.s16w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is ProfileErrorState) {
          return Center(
            child: Text('Error: ${state.message}', style: TextStyleApp.s16w400),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
