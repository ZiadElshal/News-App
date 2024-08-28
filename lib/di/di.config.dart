// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../home/category/cubit/category_details_view_model.dart' as _i47;
import '../home/news/cubit/news_widget_view_model.dart' as _i1050;
import '../model/api_manager.dart' as _i579;
import '../repository/news/dataSource/news_remote_data_source_impl.dart'
    as _i824;
import '../repository/news/news_data_source.dart' as _i604;
import '../repository/news/news_repository.dart' as _i522;
import '../repository/news/repository/news_repository_impl.dart' as _i941;
import '../repository/sources/dataSource/source_local_data_source_impl.dart'
    as _i739;
import '../repository/sources/dataSource/source_remote_data_source_impl.dart'
    as _i786;
import '../repository/sources/repository/source_repository_impl.dart' as _i892;
import '../repository/sources/source_data_source.dart' as _i460;
import '../repository/sources/source_repository_contract.dart' as _i995;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i579.ApiManager>(() => _i579.ApiManager());
    gh.factory<_i460.SourceLocalDataSource>(
        () => _i739.SourceLocalDataSourceImpl());
    gh.factory<_i604.NewsRemoteDataSource>(() =>
        _i824.NewsRemoteDataSourceImpl(apiManager: gh<_i579.ApiManager>()));
    gh.factory<_i460.SourceRemoteDataSource>(() =>
        _i786.SourceRemoteDataSourceImpl(apiManager: gh<_i579.ApiManager>()));
    gh.factory<_i995.SourceRepositoryContract>(() => _i892.SourceRepositoryImpl(
          remoteDataSource: gh<_i460.SourceRemoteDataSource>(),
          localDataSource: gh<_i460.SourceLocalDataSource>(),
        ));
    gh.factory<_i522.NewsRepository>(() => _i941.NewsRepositoryImpl(
        remoteDataSource: gh<_i604.NewsRemoteDataSource>()));
    gh.factory<_i47.CategoryDetailsViewModel>(() =>
        _i47.CategoryDetailsViewModel(
            repositoryContract: gh<_i995.SourceRepositoryContract>()));
    gh.factory<_i1050.NewsWidgetViewModel>(() =>
        _i1050.NewsWidgetViewModel(newsRepository: gh<_i522.NewsRepository>()));
    return this;
  }
}
