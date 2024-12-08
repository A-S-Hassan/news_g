import 'package:flutter/material.dart';
import 'package:news_a/home/news/newsWidget.dart';
import 'package:news_a/home/tabs/tabItem.dart';
import 'package:news_a/model/SourceResponce.dart';

class TabWidget extends StatefulWidget {
  List<Source> sourcesList;

  TabWidget({super.key, required this.sourcesList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabs: widget.sourcesList
                  .map((source) => TabItem(
                        source: source,
                        isSelected:
                            selectedIndex == widget.sourcesList.indexOf(source)
                                ? true
                                : false,
                      ))
                  .toList(),
            ),
            Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex]))
          ],
        ));
  }
}
