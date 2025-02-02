import 'package:injectable/injectable.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/repository/news/data_source/news_remote_data_source.dart';
import 'package:news_app/repository/news/repository/news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository{
  NewsRemoteDataSource remoteDataSource;
  NewsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
    return remoteDataSource.getNewsBySourceId(sourceId);
  }
}