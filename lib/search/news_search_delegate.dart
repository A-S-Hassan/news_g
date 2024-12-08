import 'package:flutter/material.dart';
import 'package:news_a/api/ApiManager.dart';
import 'package:news_a/app_colors.dart';
import 'package:news_a/home/news/newsItem.dart';
import 'package:news_a/model/NewsResponse.dart';
import 'package:news_a/model/SourceResponce.dart';
import 'package:news_a/my_app_theme.dart';

class NewSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => showResults(context),
        icon: Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: Icon(Icons.close),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      return FutureBuilder<NewsResponse?>(
          future: ApiManager.searchNews(query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Text("Something went wrong"),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.searchNews(query);
                        //setState(() {});
                      },
                      child: Text("Try Again"))
                ],
              );
            }
            if (snapshot.data!.status != 'ok') {
              return Column(
                children: [
                  Text(snapshot.data!.message!),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.searchNews(query);
                        //setState(() {});
                      },
                      child: Text("Try Again"))
                ],
              );
            }
            var newsList = snapshot.data!.articles!;
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(
                  news: newsList[index],
                );
              },
              itemCount: newsList.length,
            );
          });
    } else {
      return SizedBox();
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
    );
  }
}
