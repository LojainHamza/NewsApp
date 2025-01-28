import 'package:news_app/model/news_response.dart';

abstract class NewsRepository{
  Future<NewsResponse?> getNewsBySourceId(String sourceId);
}