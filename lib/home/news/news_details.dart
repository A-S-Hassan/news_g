import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_a/app_colors.dart';
import 'package:news_a/my_app_theme.dart';
import 'package:news_a/model/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';


class NewsDetails extends StatelessWidget {
 static const String routeName = "NewsDetails";
  NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
   final news = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
     appBar: AppBar(
      title: Text("News" , style: Theme.of(context).textTheme.titleLarge),
     ),
     body:  Container(
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
        SizedBox(height: 10,),
        Text(news.content!),
        SizedBox(height: 10,),
        Text(
         news.publishedAt??'',
         textAlign: TextAlign.end,
         style: Theme.of(context)
             .textTheme
             .titleSmall!
             .copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 15,),
        InkWell(
         onTap: (){
          _launchUrl(news.url ?? '');
         },
          child: Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
            Text("View Full Artical"),
            Icon(Icons.arrow_forward_ios , size: 15,),
           ],
          ),
        ),
       ],
      ),
     ),
    );
  }
 Future<void> _launchUrl(String url) async {
   Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
   throw Exception('Could not launch $url');
  }
 }
}
