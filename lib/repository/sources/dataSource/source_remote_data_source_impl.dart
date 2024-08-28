import 'package:injectable/injectable.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:news_app/repository/sources/source_data_source.dart';

@Injectable(as: SourceRemoteDataSource)
class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiManager apiManager;
  SourceRemoteDataSourceImpl({required this.apiManager});  //constructor injection

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    // TODO: implement getSources
    var response = await apiManager.getSources(categoryId);
    return response;
  }

}