import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/source_response.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  // todo: hold data & handle logic
  List<Source>? sourcesList;
  String? errorMessage;

  void getSources(String categoryId)async{
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try{
    var response = await APIManager.getSources(categoryId);
    if(response?.status == 'error'){
      errorMessage = response!.message!;
    }else{
      sourcesList = response!.sources!;
    }
   }catch(e){
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}