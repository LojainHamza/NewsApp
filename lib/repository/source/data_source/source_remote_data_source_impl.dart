import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/repository/source/data_source/source_remote_data_source.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  APIManager apiManager;
  SourceRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<SourceResponse?> getSources(String categoryId) async{
    var response = await apiManager.getSources(categoryId);
    return response;
  }
}