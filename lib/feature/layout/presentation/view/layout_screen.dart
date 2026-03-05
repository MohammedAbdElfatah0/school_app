import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/constants/color_manager.dart';
import 'package:school_app/core/theme/text_style.dart';
import 'package:school_app/feature/layout/presentation/cubit/layout_cubit.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          final layoutCubit = context.read<LayoutCubit>();
          return Scaffold(
            body: layoutCubit.screen[layoutCubit.currentIndex],
            extendBody: true,
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: BottomNavigationBar(
                  currentIndex: layoutCubit.currentIndex,
                  onTap: (value) {
                    layoutCubit.changeIndex(value);
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.book),
                      label: 'My Coures',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                  selectedItemColor: ColorManager.whiteColor,
                  selectedFontSize: 28,
                  unselectedItemColor: ColorManager.greyColor.withAlpha(250),
                  unselectedFontSize: 21,
                  selectedLabelStyle: TextStyleApp.s16w700,
                  unselectedLabelStyle: TextStyleApp.s14w400,
                  backgroundColor: ColorManager.primaryColor,
                  type: BottomNavigationBarType.fixed,
                  elevation: 0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
