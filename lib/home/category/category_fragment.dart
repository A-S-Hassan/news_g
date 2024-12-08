import 'package:flutter/material.dart';
import 'package:news_a/home/category/category_details.dart';
import 'package:news_a/home/category/category_item.dart';
import 'package:news_a/model/Category.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = Category.getCategories();
  Function onCategoryItemClick ;
  CategoryFragment({required this.onCategoryItemClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Pick your category \n of interest",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 15,),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    onCategoryItemClick(categoriesList[index]);
                  },
                    child: CategoryItem(category: categoriesList[index] , index: index,));
              },
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}
