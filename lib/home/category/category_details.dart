import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/category/cubit/category_details_view_model.dart';
import 'package:news_app/home/category/cubit/sources_states.dart';
import 'package:news_app/home/tabs/tab_widget.dart';
import 'package:news_app/model/Category.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel categoryDetailsViewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryDetailsViewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, SourceStates>(
      bloc: categoryDetailsViewModel,
      ///to run must return widget in last
        builder: (context, state){
          if(state is SourceSuccessState){
            return TabWidget(sourcesList: state.sourcesList);
          }
          else if(state is SourceErrorState){
            return Column(
              children: [
                Text(state.errorMessage,
                  style: Theme.of(context).textTheme.titleMedium,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryLightColor,
                      foregroundColor: AppColors.whiteColor,
                    ),
                    onPressed: (){
                      categoryDetailsViewModel.getSources(widget.category.id);
                    },
                    child: Text("Try Again")
                ),
              ],
            );
          }
          else{
            return Center(child: CircularProgressIndicator(
              color: AppColors.primaryLightColor,
            )
            );
          }
        }
    );

    //   ChangeNotifierProvider(
    //   create: (context) => categoryDetailsViewModel,
    //   child: Consumer<CategoryDetailsViewModel>(
    //     builder: (context, categoryDetailsViewModel, child){
    //
    //       if(categoryDetailsViewModel.errorMessage != null){
    //         return Column(
    //           children: [
    //             Text(categoryDetailsViewModel.errorMessage!,
    //               style: Theme.of(context).textTheme.titleMedium,),
    //             ElevatedButton(
    //               style: ElevatedButton.styleFrom(
    //                 backgroundColor: AppColors.primaryLightColor,
    //                 foregroundColor: AppColors.whiteColor,
    //               ),
    //                 onPressed: (){
    //                   categoryDetailsViewModel.getSources(widget.category.id);
    //                 },
    //                 child: Text("Try Again")
    //             ),
    //           ],
    //         );
    //       }
    //       else if(categoryDetailsViewModel.sourceList == null){
    //         return Center(child: CircularProgressIndicator(
    //           color: AppColors.primaryLightColor,
    //         )
    //         );
    //       }else{
    //         return TabWidget(sourcesList: categoryDetailsViewModel.sourceList!);
    //       }
    //     }
    //   ),
    //
    //   // FutureBuilder<SourceResponse?>(
    //   //   future: ApiManager.getSources(widget.category.id),
    //   //   builder: (context, snapshot){
    //   //     ///in loading case
    //   //     if(snapshot.connectionState == ConnectionState.waiting){
    //   //       return Center(child: CircularProgressIndicator(
    //   //         color: AppColors.primaryLightColor,
    //   //       )
    //   //       );
    //   //       ///in client error case
    //   //     }else if(snapshot.hasError){
    //   //       return Column(
    //   //         children: [
    //   //           Text("Something went wrong"),
    //   //           ElevatedButton(
    //   //               onPressed: (){
    //   //                 ApiManager.getSources(widget.category.id);
    //   //                 setState(() {
    //   //
    //   //                 });
    //   //               },
    //   //               child: Text("Try Again")
    //   //           ),
    //   //         ],
    //   //       );
    //   //     }
    //   //     ///server(response) => success , error
    //   //     // if(snapshot.data == null){
    //   //     //   return Text("No data available");
    //   //     // }
    //   //     if(snapshot.data!.status != "ok"){
    //   //       return Column(
    //   //         children: [
    //   //           Text(snapshot.data!.message!),
    //   //           ElevatedButton(
    //   //               onPressed: (){
    //   //                 ApiManager.getSources(widget.category.id);
    //   //                 setState(() {
    //   //
    //   //                 });
    //   //               },
    //   //               child: Text("Try Again")
    //   //           ),
    //   //         ],
    //   //       );
    //   //     }
    //   //     ///in success case
    //   //     var sourceList = snapshot.data!.sources!;
    //   //     // if(sourceList == null){
    //   //     //   return Text("No sources available");
    //   //     // }
    //   //     return TabWidget(sourcesList: sourceList);
    //   //   },
    //   //
    //   // ),
    // );
  }
}
