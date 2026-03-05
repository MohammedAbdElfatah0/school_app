import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/networks/supabase_service.dart';
import 'package:school_app/feature/auth/data/repos/auth_repo.dart';
import 'package:school_app/feature/layout/presentation/view/layout_screen.dart';

import '../cubit/login/login_cubit.dart';
import 'login_screen.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  final session = SupabaseService.instance.client.auth.currentSession;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => LoginCubit(AuthRepo(SupabaseService.instance.client)),
      child: session != null ? const LayoutScreen() : const LoginScreen(),
    );
  }
}
