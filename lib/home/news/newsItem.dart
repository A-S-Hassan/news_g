import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_a/app_colors.dart';
import 'package:news_a/home/news/news_details.dart';
import 'package:news_a/model/NewsResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetails.routeName , arguments: news);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container(
            //   clipBehavior: Clip.antiAlias,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Image.network(news.urlToImage ?? ''),
            // ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.cover,
                imageUrl: news.urlToImage ?? '',
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(news.author ?? '',
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.grey, fontWeight: FontWeight.w400)),
            Text(
              news.title ?? '',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            Text(
              news.publishedAt??'',
              textAlign: TextAlign.end,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
