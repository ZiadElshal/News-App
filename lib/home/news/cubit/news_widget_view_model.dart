import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/news/cubit/news_states.dart';
import 'package:news_app/model/api_manager.dart';

class NewsWidgetViewModel extends Cubit<NewsStates>{
  //hold data - handle logic
  NewsWidgetViewModel():super(NewsLoadingState());

  void getNewsBySourceId(String sourceID) async{

    try{
      emit(NewsLoadingState());
      var response = await ApiManager.getNewsBySourceId(sourceID);
      if(response?.status == "error"){
        emit(NewsErrorState(errorMessage: response!.message!));
        return;
      }
      if(response?.status == "ok"){
        emit(NewsSuccessState(newsList: response!.articles!));
        return;
      }
    }catch(e){
      emit(NewsErrorState(errorMessage: "Error Loading Source List.!\n" + e.toString()));
    }
  }
}