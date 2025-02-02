import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';

class APIManager{
  static APIManager? _instance;    // null - object

  //todo: private constructor
  APIManager._();

  static APIManager getInstance(){
    _instance ??= APIManager._();
    return _instance!;
  }

  Future<SourceResponse?> getSources(String categoryId) async{
    Uri url = Uri.https(
        APIConstants.baseUrl,
        EndPoints.sourceApi,
        {
          'apiKey': APIConstants.apiKey,
          'category': categoryId
        });
    // String => json => object
    try{
      var response = await http.get(url);
      var responseBody = response.body;      // String
      var json = jsonDecode(responseBody);   // json
      return SourceResponse.fromJson(json);         // Object
      //SourceResponse.fromJson(jsonDecode(response.body));
    }catch(e){
      throw e;
    }
  }

  Future<NewsResponse?> getNewsBySourceId(String sourceId)async{
    Uri url = Uri.https(
      APIConstants.baseUrl,
      EndPoints.newsApi,
    {
      'apiKey': APIConstants.apiKey,
      'sources': sourceId
    });
    try{
    var response = await http.get(url);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return NewsResponse.fromJson(json);
    // return NewsResponse.fromJson(jsonDecode(response.body));
    }catch(e){
      throw e;
    }
  }

  static Future<NewsResponse?> getAllNews({String? query})async{
    String searchQuery = query ?? 'news';
    Uri url = Uri.https(
        APIConstants.baseUrl,
        EndPoints.newsApi,
        {
          'apiKey': APIConstants.apiKey,
          'q': Uri.encodeComponent(searchQuery),
        });
    try{
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
      // return NewsResponse.fromJson(jsonDecode(response.body));
    }catch(e){
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsByQuery(String? query) async {
    if (query == null || query.isEmpty) {
      return await getAllNews(query: 'news');
    }

    Uri url = Uri.https(
        APIConstants.baseUrl,
        EndPoints.newsApi,
        {
          'apiKey': APIConstants.apiKey,
          'q': Uri.encodeComponent(query)
        }
    );

    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

}

/*
  https://newsapi.org/v2/top-headlines/sources?apiKey=1e37335100b84eb49ec664c7403fadec
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=1e37335100b84eb49ec664c7403fadec
*/