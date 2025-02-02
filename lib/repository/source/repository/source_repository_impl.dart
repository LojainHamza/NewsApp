import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/repository/source/data_source/source_offline_data_source.dart';
import 'package:news_app/repository/source/data_source/source_remote_data_source.dart';
import 'package:news_app/repository/source/repository/source_repository.dart';

class SourceRepositoryImpl implements SourceRepository{
  SourceRemoteDataSource remoteDataSource;
  SourceOfflineDataSource offlineDataSource;
  SourceRepositoryImpl({required this.remoteDataSource,required this.offlineDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) async{
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult.contains(ConnectivityResult.mobile)
        ||connectivityResult.contains(ConnectivityResult.wifi)){
      // todo: internet => remote DS
      var sourceResponse = await remoteDataSource.getSources(categoryId);
      // todo: save sources
      offlineDataSource.saveSources(sourceResponse,categoryId);
      return sourceResponse;
    }else{
     // todo: no internet => offline DS
     var sourceResponse = await offlineDataSource.getSources(categoryId);
     return sourceResponse;
    }
  }
}