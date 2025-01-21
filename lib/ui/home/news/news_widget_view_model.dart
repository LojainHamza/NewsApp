import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/news_response.dart';

class NewsWidgetViewModel extends ChangeNotifier{
  // todo: hold data - handle logic
  List<News>? newsList;
  String? errorMessage;

  void getNewsBySourceId(String sourceId)async{
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try{
    var response = await APIManager.getNewsBySourceId(sourceId);
    if(response?.status == 'error'){
      errorMessage = response!.message!;
    }else{
      newsList = response!.articles!;
    }
    }catch(e){
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}