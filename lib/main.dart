import 'package:flutter/material.dart';
import 'package:movie/core/services/services_locator.dart';
import 'package:movie/core/utils/theme_manager.dart';

import 'features/movie/presentation/pages/main_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,

      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,

      // darkTheme:darkTheme,
      home:  const MainScreen(),
    );
  }
}
