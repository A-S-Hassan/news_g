import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_a/api/ApiConstants.dart';
import 'package:news_a/model/NewsResponse.dart';
import 'package:news_a/model/SourceResponce.dart';

class ApiManager {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=035fd7e4749d43daace56dfa9f3e9808

  static Future<SourceResponce?> getSources(String sourceId) async {
    Uri url = Uri.https(ApiConstant.serverName, ApiConstant.endPointSources,
        {'apiKey': ApiConstant.apiKey, 'category': sourceId});
    var response = await http.get(url);
    try {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponce.fromJson(json);
    } catch (e) {
      throw e;
    }

    /// return SourceResponce.fromJson(jsonDecode(response.body));
  }

  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=035fd7e4749d43daace56dfa9f3e9808
  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstant.serverName, ApiConstant.endPointNews,
        {'apiKey': ApiConstant.apiKey, 'sources': sourceId});

    /// custoimse for api
    var response = await http.get(url);
    try {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }


  static Future<NewsResponse?> searchNews(String query) async {
    Uri url = Uri.https(ApiConstant.serverName, ApiConstant.endPointNews,
        {'apiKey': ApiConstant.apiKey, 'q' : query});

    /// custoimse for api
    var response = await http.get(url);
    try {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
