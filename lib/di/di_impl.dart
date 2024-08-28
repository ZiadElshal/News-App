// //resolve dependency => dependency injection
//
// //todo: viewModel => needs object from repository
// //todo: repository => needs object from dataSource
// //todo: dataSource => needs object from apiManager
//
// import 'package:news_app/model/api_manager.dart';
// import 'package:news_app/repository/news/dataSource/news_remote_data_source_impl.dart';
// import 'package:news_app/repository/news/news_data_source.dart';
// import 'package:news_app/repository/news/news_repository.dart';
// import 'package:news_app/repository/news/repository/news_repository_impl.dart';
// import 'package:news_app/repository/sources/dataSource/source_local_data_source_impl.dart';
// import 'package:news_app/repository/sources/dataSource/source_remote_data_source_impl.dart';
// import 'package:news_app/repository/sources/repository/source_repository_impl.dart';
// import 'package:news_app/repository/sources/source_data_source.dart';
// import 'package:news_app/repository/sources/source_repository_contract.dart';
//
// SourceRepositoryContract injectSourceRepository(){
//   return SourceRepositoryImpl(
//       remoteDataSource: injectRemoteDataSource(),
//       localDataSource: injectLocalDataSource()
//   );
// }
//
// SourceRemoteDataSource injectRemoteDataSource(){
//   return SourceRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
// }
//
// SourceLocalDataSource injectLocalDataSource(){
//   return SourceLocalDataSourceImpl();
// }
//
// NewsRepository injectNewsRepository(){
//   return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());
// }
//
// NewsRemoteDataSource injectNewsRemoteDataSource(){
//   return NewsRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
// }