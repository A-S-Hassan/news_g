import 'package:flutter/material.dart';
import 'package:news_a/app_colors.dart';
import 'dart:async';
import 'package:news_a/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: AppColors.whiteColor,
          child: Image(
            image: AssetImage("assets/images/pattern.png"),
          ),
        ),
        Image(
          image: AssetImage("assets/images/logo.png"),
        ),
      ],
    );
  }
}
