import 'package:flutter/material.dart';
import 'package:news_a/app_colors.dart';
import 'package:news_a/model/Category.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;

  CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(index % 2 == 0 ? 0 : 20),
          bottomLeft: Radius.circular(index % 2 == 0 ? 20 : 0),
        ),
      ),
      child: Column(
        children: [
          Image.asset(category.ImagePath , height: MediaQuery.of(context).size.height*0.15,),
          Text(category.title , style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: AppColors.whiteColor
          ),),
        ],
      ),
    );
  }
}
