import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/networks/supabase_service.dart';
import 'package:school_app/core/routes/app_routes.dart';
import 'package:school_app/core/routes/routes.dart';
import 'package:school_app/feature/auth/data/repos/auth_repo.dart';
import 'package:school_app/feature/auth/presentation/cubit/login/login_cubit.dart';

class SchoolApp extends StatelessWidget {
  const SchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => LoginCubit(AuthRepo(SupabaseService.instance.client)),
      child: MaterialApp(
        title: 'School App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        onGenerateRoute: AppRoutes().generateRoute,
        initialRoute: Routes.authRoute,
      ),
    );
  }
}
