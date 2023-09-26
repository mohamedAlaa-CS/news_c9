import 'package:flutter/material.dart';
import 'package:news/screens/home/home_Screen.dart';
import 'package:news/screens/news/news_screen.dart';
import 'package:news/screens/splash/splash_screen.dart';
import 'package:news/shared/theming/theming.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.myTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
        NewsScreen.routeName: (context) => NewsScreen(),
      },
    );
  }
}
