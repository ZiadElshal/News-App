import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/home/news/cubit/news_states.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:news_app/repository/news/news_repository.dart';

@injectable
class NewsWidgetViewModel extends Cubit<NewsStates>{
  //hold data - handle logic
  NewsRepository newsRepository;
  NewsWidgetViewModel({required this.newsRepository}):super(NewsLoadingState());

  void getNewsBySourceId(String sourceID) async{

    try{
      emit(NewsLoadingState());
      var response = await newsRepository.getNewsBySourceId(sourceID);
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