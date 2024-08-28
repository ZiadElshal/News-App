import 'package:news_app/model/NewsResponse.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse?> getNewsBySourceId(String sourceID);
}
abstract class NewsLocalDataSource {}