import 'package:flutter/material.dart';
import 'package:news_a/api/ApiManager.dart';
import 'package:news_a/model/SourceResponce.dart';
import 'package:news_a/home/tabs/tabWidget.dart';
import 'package:news_a/app_colors.dart';
import 'package:news_a/model/Category.dart';

class CategoryWidget extends StatefulWidget{
  Category category;
  CategoryWidget({super.key , required this.category});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponce?>(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ));
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text("something went wrong"),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources(widget.category.id);
                    setState(() {});
                  },
                  child: Text("Try Again"))
            ],
          );
        }
        // server(response) => error, success
        if (snapshot.data!.status != "ok") {
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getSources(widget.category.id);
                  setState(() {});
                },
                child: Text("Try Again"),
              ),
            ],
          );
        }

        /// success
        var sourceList = snapshot.data!.sources!;
        return TabWidget(
          sourcesList: sourceList,
        );
      },
    );
  }
}
