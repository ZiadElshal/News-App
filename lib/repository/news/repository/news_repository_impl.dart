import 'package:injectable/injectable.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/repository/news/news_data_source.dart';
import 'package:news_app/repository/news/news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository{
  NewsRemoteDataSource remoteDataSource;
  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceID) {
    // TODO: implement getNewsBySourceId
    return remoteDataSource.getNewsBySourceId(sourceID);
  }

}