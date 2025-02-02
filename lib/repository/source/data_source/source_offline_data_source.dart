import 'package:news_app/model/source_response.dart';

abstract class SourceOfflineDataSource{
  Future<SourceResponse?> getSources(String categoryId);
  void saveSources(SourceResponse? sourceResponse, String categoryId);
}