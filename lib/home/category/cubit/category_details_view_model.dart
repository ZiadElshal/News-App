import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/home/category/cubit/sources_states.dart';
import 'package:news_app/model/api_manager.dart';

class CategoryDetailsViewModel extends Cubit<SourceStates>{
  //hold data - handle logic
  CategoryDetailsViewModel():super(SourceLoadingState());

  void getSources(String categoryId) async{

    try{
      emit(SourceLoadingState());
      var response = await ApiManager.getSources(categoryId);
      if(response?.status == "error"){
        emit(SourceErrorState(errorMessage: response!.message!));
        return;
      }
      if(response?.status == "ok"){
        emit(SourceSuccessState(sourcesList: response!.sources!));
        return;
      }
    }catch(e){
      emit(SourceErrorState(errorMessage: "Error Loading Source List.!\n" + e.toString()));
    }
  }
}