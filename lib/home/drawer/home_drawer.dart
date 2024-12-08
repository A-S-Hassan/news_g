import 'package:flutter/material.dart';
import 'package:news_a/app_colors.dart';

class HomeDrawer extends StatelessWidget {
  Function onSideMenuItemClick;
  static const int categories = 1 ;
  static const int settings = 2 ;

  HomeDrawer({super.key, required this.onSideMenuItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
            color: AppColors.primaryColor,
            child: Center(
                child: Text(
              "News App!",
              style: Theme.of(context).textTheme.titleLarge,
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                onSideMenuItemClick(categories);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Categories",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.blackColor),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                onSideMenuItemClick(settings);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Settings",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.blackColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
