import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/api_manager.dart';

class NewsWidgetViewModel extends ChangeNotifier{
  //hold data - handle logic

  List<News>? newsList;
  String? errorMessage;

  void getNewsBySourceId(String sourceID) async{
    newsList = null;
    errorMessage = null;
    notifyListeners();

    try{
      var response = await ApiManager.getNewsBySourceId(sourceID);
      if(response?.status == "error"){
        errorMessage = response!.message;
      }else{
        newsList = response!.articles;
      }
    }catch(e){
      errorMessage = "Error Loading News List.";
    }
    notifyListeners();
  }
}