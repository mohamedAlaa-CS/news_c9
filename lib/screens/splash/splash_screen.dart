import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/screens/home/home_Screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
Timer(const Duration(seconds: 2), () {
Navigator.pushReplacementNamed(context, HomeScreen.routeName);
}) ;   super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/splash.png'),
          fit: BoxFit.fill
        )
      ),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
        ));
  }
}
