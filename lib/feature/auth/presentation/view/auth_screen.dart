import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/networks/supabase_service.dart';
import 'package:school_app/feature/auth/data/repos/auth_repo.dart';

import '../cubit/login/login_cubit.dart';
import 'login_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => LoginCubit(AuthRepo(SupabaseService.instance.client)),
      child: const LoginScreen(),
    );
  }
}
