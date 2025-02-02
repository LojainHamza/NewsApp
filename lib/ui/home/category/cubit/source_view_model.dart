import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/repository/source/repository/source_repository.dart';
import 'package:news_app/ui/home/category/cubit/source_states.dart';

@injectable
class SourceViewModel extends Cubit<SourceStates>{
  SourceRepository sourceRepository;
  SourceViewModel({required this.sourceRepository}):super(SourceLoadingState());
  
  void getSources(String categoryId)async{
    try{
      emit(SourceLoadingState());
      var response = await sourceRepository.getSources(categoryId);
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