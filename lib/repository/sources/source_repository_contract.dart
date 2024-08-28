import 'package:news_app/model/SourceResponse.dart';

abstract class SourceRepositoryContract{
  Future<SourceResponse?> getSources(String categoryId);
}