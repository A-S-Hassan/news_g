import 'package:flutter/material.dart';
import 'package:news_a/app_colors.dart';

class Category {
  String id;
  String ImagePath;
  String title;
  Color color;

  Category(
      {required this.id,
      required this.title,
      required this.ImagePath,
      required this.color});

  //business entertainment general health  science sports technology

  static List<Category> getCategories() {
    return [
      Category(
          id: 'sports',
          title: 'Sports',
          ImagePath: 'assets/images/sports.png',
          color: AppColors.redColor),
      Category(
          id: 'general',
          title: 'General',
          ImagePath: 'assets/images/Politics.png',
          color: AppColors.darkBlueColor),
      Category(
          id: 'entertainment',
          title: 'Entertainment',
          ImagePath: 'assets/images/environment.png',
          color: AppColors.blueColor),

      Category(
          id: 'health',
          title: 'Health',
          ImagePath: 'assets/images/health.png',
          color: AppColors.pinkColor),
      Category(
          id: 'science',
          title: 'Science',
          ImagePath: 'assets/images/science.png',
          color: AppColors.yellowColor),
      Category(
          id: 'technology',
          title: 'Technology',
          ImagePath: 'assets/images/science.png',
          color: AppColors.darkBlueColor),
    ];
  }
}
