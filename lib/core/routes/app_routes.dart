import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/routes/routes.dart';
import 'package:school_app/feature/auth/data/repos/auth_repo.dart';
import 'package:school_app/feature/auth/presentation/cubit/signup/sign_up_cubit.dart';
import 'package:school_app/feature/auth/presentation/view/auth_screen.dart';
import 'package:school_app/feature/layout/presentation/view/layout_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../feature/auth/presentation/view/login_screen.dart';
import '../../feature/auth/presentation/view/sign_up_screen.dart';

class AppRoutes {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.authRoute:
        return MaterialPageRoute(builder: (_) => AuthScreen());
      case Routes.layout:
        return MaterialPageRoute(builder: (_) => const LayoutScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder:
              (_) => const LoginScreen(),
        );
      case Routes.signUpRoute:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (_) => SignUpCubit(AuthRepo(Supabase.instance.client)),
                child: const SignUpScreen(),
              ),
        );
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
