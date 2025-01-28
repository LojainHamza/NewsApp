import 'package:news_app/model/source_response.dart';
import 'package:news_app/repository/source/data_source/source_remote_data_source.dart';
import 'package:news_app/repository/source/repository/source_repository.dart';

class SourceRepositoryImpl implements SourceRepository{
  SourceRemoteDataSource remoteDataSource;
  SourceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) {
    return remoteDataSource.getSources(categoryId);
  }
}