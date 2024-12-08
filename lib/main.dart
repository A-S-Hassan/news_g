import 'package:flutter/material.dart';
import 'package:news_a/home/home_screen.dart';
import 'package:news_a/home/news/news_details.dart';
import 'package:news_a/splash_screen.dart';
import 'package:news_a/my_app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsDetails.routeName: (context) => NewsDetails(),
      },
      theme: MyAppTheme.lightTheme,
    );
  }
}
