import 'package:flutter/material.dart';
import 'package:school_app/core/routes/app_routes.dart';
import 'package:school_app/core/routes/routes.dart';

class SchoolApp extends StatelessWidget {
  const SchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      onGenerateRoute: AppRoutes().generateRoute,
      initialRoute: Routes.loginRoute,
    );
  }
}