import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/repository/news/data_source/news_remote_data_source.dart';
import 'package:news_app/repository/news/data_source/news_remote_data_source_impl.dart';
import 'package:news_app/repository/news/repository/news_repository.dart';
import 'package:news_app/repository/news/repository/news_repository_impl.dart';

import 'package:news_app/ui/home/news/cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsStates>{
  NewsRepository newsRepository;
  NewsViewModel({required this.newsRepository}):super(NewsLoadingState());

  void getNewsBySourceId(String sourceId)async{
    try{
      emit(NewsLoadingState());
      var response = await newsRepository.getNewsBySourceId(sourceId);
      if(response?.status == 'error'){
        emit(NewsErrorState(errorMessage: response!.message!));
        return;
      }else{
        emit(NewsSuccessState(newsList: response!.articles!));
        return;
      }
    }catch(e){
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}