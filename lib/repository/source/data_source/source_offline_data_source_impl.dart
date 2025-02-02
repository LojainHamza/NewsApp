import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/repository/source/data_source/source_offline_data_source.dart';

@Injectable(as: SourceOfflineDataSource)
class SourceOfflineDataSourceImpl implements SourceOfflineDataSource{
  @override
  Future<SourceResponse?> getSources(String categoryId) async{
    // todo: read 'get data'
    var box = await Hive.openBox('SourcesTab');
    var sourceTab = box.get(categoryId);
    // var sourceTab = SourceResponse.fromJson(box.get(categoryId));
    return sourceTab;
  }

  @override
  void saveSources(SourceResponse? sourceResponse, String categoryId) async{
    // todo: write 'save data'
    var box = await Hive.openBox('SourcesTab');
    await box.put(categoryId, sourceResponse);
    // await box.put(categoryId, sourceResponse?.toJson());
    await box.close();
  }
}