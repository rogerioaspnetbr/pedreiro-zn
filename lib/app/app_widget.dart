import 'package:flutter/material.dart';
import 'package:pedreiro_zn/app/core/theme/app_theme.dart';
import 'package:pedreiro_zn/app/features/home/presentation/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedreiro ZN',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}