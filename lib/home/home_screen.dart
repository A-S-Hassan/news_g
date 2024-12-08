import 'package:flutter/material.dart';
import 'package:news_a/app_colors.dart';
import 'package:news_a/home/category/category_details.dart';
import 'package:news_a/home/category/category_fragment.dart';
import 'package:news_a/home/settings/settings_tab.dart';
import 'package:news_a/home/tabs/tabWidget.dart';
import 'package:news_a/api/ApiManager.dart';
import 'package:news_a/model/Category.dart';
import 'package:news_a/model/SourceResponce.dart';
import 'package:news_a/my_app_theme.dart';
import 'package:news_a/home/drawer/home_drawer.dart';
import 'package:news_a/search/news_search_delegate.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            "assets/images/pattern.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.090,
            title: Text(
              selectedSideMenuItem == HomeDrawer.settings
                  ? 'Settings'
                  : selectedCategory == null
                      ? "News App"
                      : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              IconButton(
                onPressed: () => showSearch(context: context , delegate: NewSearchDelegate()),
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
          drawer: Drawer(
            shadowColor: Colors.white,
            child: HomeDrawer(
              onSideMenuItemClick: onSideMenuItemClick,
            ),
          ),
          body: selectedSideMenuItem == HomeDrawer.settings
              ? SettingsTab()
              : selectedCategory == null
                  ? CategoryFragment(
                      onCategoryItemClick: onCategoryItemClick,
                    )
                  : CategoryWidget(category: selectedCategory!),
        ),
      ],
    );
  }

  Category? selectedCategory;

  void onCategoryItemClick(Category newCategory) {
    // newCategory => user select
    selectedCategory = newCategory;
    setState(() {});
  }

  int selectedSideMenuItem = HomeDrawer.categories;

  void onSideMenuItemClick(int newSideMenuItem) {
    selectedSideMenuItem = newSideMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
