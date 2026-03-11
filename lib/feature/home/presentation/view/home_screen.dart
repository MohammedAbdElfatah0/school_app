import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/feature/home/data/repo/home_repo.dart';
import 'package:school_app/feature/home/presentation/cubit/home_cubit.dart';
import 'package:school_app/feature/profile/data/repo/profile_repo.dart';
import 'package:school_app/feature/profile/presentation/cubit/profile_cubit.dart';

import '../widget/body_home.dart';
import '../widget/header_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit(HomeRepo())..getCourses()),
        BlocProvider(
          create: (context) => ProfileCubit(ProfileRepo())..getUserProfile(),
        ),
      ],
      child: const SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(children: [HeaderHome(), BodyHome()]),
          ),
        ),
      ),
    );
  }
}
