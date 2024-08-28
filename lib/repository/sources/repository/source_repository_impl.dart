import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/repository/sources/source_data_source.dart';
import 'package:news_app/repository/sources/source_repository_contract.dart';

@Injectable(as: SourceRepositoryContract)
class SourceRepositoryImpl implements SourceRepositoryContract{
  SourceRemoteDataSource remoteDataSource;
  SourceLocalDataSource localDataSource;

  SourceRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    // TODO: implement getSources
    var connectivityResult = await Connectivity().checkConnectivity();
    if(
    connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)
    ){
      // TODO: internet => remote data source
      var sourceResponse = await remoteDataSource.getSources(categoryId);
      localDataSource.saveSources(sourceResponse, categoryId);
      return sourceResponse;
    }else{
      // TODO: no internet => local data source
      var responseLocalData = await localDataSource.getSources(categoryId);
      return responseLocalData;
    }
  }

}