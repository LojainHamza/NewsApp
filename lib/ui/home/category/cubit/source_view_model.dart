import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/ui/home/category/cubit/source_states.dart';
class SourceViewModel extends Cubit<SourceStates>{
  SourceViewModel():super(SourceLoadingState());
  
  void getSources(String categoryId)async{
    try{
      emit(SourceLoadingState());
      var response = await APIManager.getSources(categoryId);
      if(response?.status == 'error'){
        emit(SourceErrorState(errorMessage: response!.message!));
        return;
      }
      if(response?.status == 'ok'){
        emit(SourceSuccessState(sourcesList: response!.sources!));
        return;
      }
    }catch(e){
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}