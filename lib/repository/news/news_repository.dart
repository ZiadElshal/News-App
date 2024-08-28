import 'package:news_app/model/NewsResponse.dart';

abstract class NewsRepository{
  Future<NewsResponse?> getNewsBySourceId(String sourceID);
}