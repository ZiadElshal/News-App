import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/news/cubit/news_states.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/home/news/cubit/news_widget_view_model.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel newsWidgetViewModel = NewsWidgetViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsWidgetViewModel.getNewsBySourceId(widget.source.id ?? "");
  }
  
  @override
  Widget build(BuildContext context) {
    newsWidgetViewModel.getNewsBySourceId(widget.source.id ?? "");
    return BlocBuilder<NewsWidgetViewModel, NewsStates>(
      bloc: newsWidgetViewModel,
        builder: (context, state){
          if(state is NewsSuccessState){
            return ListView.builder(
              itemBuilder: (context, index){
                return NewsItem(news: state.newsList[index]);
                },
              itemCount: state.newsList.length,
            );
          }
          else if(state is NewsErrorState){
            return Column(
              children: [
                Text(state.errorMessage),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.whiteColor,
                      backgroundColor: AppColors.primaryLightColor,
                    ),
                    onPressed: (){
                      newsWidgetViewModel.getNewsBySourceId(widget.source.id ?? "");
                      },
                    child: Text("Try Again")
                )
              ],
            );
          }
          else{
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ),
            );
          }
        }
    );
    //   ChangeNotifierProvider(
    //   create: (context) => newsWidgetViewModel,
    //   child: Consumer<NewsWidgetViewModel>(
    //     builder: (context, newsWidgetViewModel, child){
    //
    //       if(newsWidgetViewModel.errorMessage != null){
    //         return Column(
    //           children: [
    //             Text(newsWidgetViewModel.errorMessage!),
    //             ElevatedButton(
    //                 style: ElevatedButton.styleFrom(
    //                   foregroundColor: AppColors.whiteColor,
    //                   backgroundColor: AppColors.primaryLightColor,
    //                 ),
    //                 onPressed: (){
    //                   newsWidgetViewModel.getNewsBySourceId(widget.source.id ?? "");
    //                 },
    //                 child: Text("Try Again")
    //             )
    //           ],
    //         );
    //       }
    //       else if(newsWidgetViewModel.newsList == null){
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: AppColors.primaryLightColor,
    //           ),
    //         );
    //       }else{
    //         return ListView.builder(
    //           itemBuilder: (context, index){
    //             return NewsItem(news: newsWidgetViewModel.newsList![index]);
    //           },
    //           itemCount: newsWidgetViewModel.newsList!.length,
    //         );
    //       }
    //     },
    //
    //   ),
    //
    //   // FutureBuilder<NewsResponse?>(
    //   //     future: ApiManager.getNewsBySourceId(widget.source.id ?? ""),
    //   //     builder: (context, snapshot) {
    //   //       ///in loading case
    //   //       if(snapshot.connectionState == ConnectionState.waiting){
    //   //         return Center(
    //   //           child: CircularProgressIndicator(
    //   //             color: AppColors.primaryLightColor,
    //   //           ),
    //   //         );
    //   //         ///in client error case
    //   //       }else if(snapshot.hasError){
    //   //         return Column(
    //   //           children: [
    //   //             Text("Something went wrong"),
    //   //             ElevatedButton(
    //   //               style: ElevatedButton.styleFrom(
    //   //                 foregroundColor: AppColors.whiteColor,
    //   //                 backgroundColor: AppColors.primaryLightColor,
    //   //               ),
    //   //                 onPressed: (){
    //   //                   ApiManager.getNewsBySourceId(widget.source.id ?? "");
    //   //                   setState(() {
    //   //
    //   //                   });
    //   //                 },
    //   //                 child: Text("Try Again")
    //   //             )
    //   //           ],
    //   //         );
    //   //       }
    //   //       ///server(response) => success , error
    //   //       if(snapshot.data!.status! != "ok"){
    //   //         return Column(
    //   //           children: [
    //   //             Text(snapshot.data!.message!),
    //   //             ElevatedButton(
    //   //                 style: ElevatedButton.styleFrom(
    //   //                   foregroundColor: AppColors.whiteColor,
    //   //                   backgroundColor: AppColors.primaryLightColor,
    //   //                 ),
    //   //                 onPressed: (){
    //   //                   ApiManager.getNewsBySourceId(widget.source.id ?? "");
    //   //                   setState(() {
    //   //
    //   //                   });
    //   //                 },
    //   //                 child: Text("Try Again")
    //   //             )
    //   //           ],
    //   //         );
    //   //       }
    //   //       ///in success case
    //   //       var newsList = snapshot.data!.articles!;
    //   //       return ListView.builder(
    //   //           itemBuilder: (context, index){
    //   //             return NewsItem(news: newsList[index]);
    //   //           },
    //   //         itemCount: newsList.length,
    //   //       );
    //   //     }
    //   // ),
    // );
  }
}
