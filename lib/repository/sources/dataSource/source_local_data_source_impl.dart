import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/repository/sources/source_data_source.dart';

@Injectable(as: SourceLocalDataSource)
class SourceLocalDataSourceImpl implements SourceLocalDataSource{
  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    // TODO: implement getSources
    var box = await Hive.openBox("tabs");   //open box to get data
    var sourceResponse = SourceResponse.fromJson(box.get(categoryId));  //convert from json to object
    return sourceResponse;
  }

  @override
  void saveSources(SourceResponse? sourceResponse, String category) async {
    // TODO: implement saveSources
    var box = await Hive.openBox("tabs");    //open box to save data
    await box.put(category, sourceResponse?.toJson());   //write data (save), //convert from object to json
    await box.close();                       //close box
  }

}