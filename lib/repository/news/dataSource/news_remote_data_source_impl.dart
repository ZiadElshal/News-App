import 'package:injectable/injectable.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:news_app/repository/news/news_data_source.dart';

@Injectable(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  ApiManager apiManager;
  NewsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceID) async {
    // TODO: implement getNewsBySourceId
    var response = await apiManager.getNewsBySourceId(sourceID);
    return response;
  }

}