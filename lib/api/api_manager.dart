import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/source_response.dart';

class APIManager{
  static Future<SourceResponse?> getSources() async{
    Uri url = Uri.https(
        APIConstants.baseUrl,
        EndPoints.sourceApi,
        {
          'apiKey': APIConstants.apiKey
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
}

/*
  https://newsapi.org/v2/top-headlines/sources?apiKey=1e37335100b84eb49ec664c7403fadec
*/