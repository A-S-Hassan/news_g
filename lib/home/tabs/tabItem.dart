import 'package:flutter/material.dart';
import 'package:news_a/app_colors.dart';
import 'package:news_a/model/SourceResponce.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Source source;

  TabItem({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.only(
        top: 10
      ),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
      border: Border.all(
        color: AppColors.primaryColor,
        width: 3,
      ),
    ),
    child: Text(source.name ??'', style: Theme.of(context).textTheme.titleMedium!.copyWith(
    color: isSelected ? AppColors.whiteColor : AppColors.primaryColor
    ),)
    ,
    );
  }
}
