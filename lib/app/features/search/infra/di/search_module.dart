import 'package:concepta/app/features/search/data/data_sources/local/search_local_data_source.dart';
import 'package:concepta/app/features/search/data/data_sources/local/search_local_data_source_impl.dart';
import 'package:concepta/app/features/search/data/data_sources/remote/search_remote_data_source.dart';
import 'package:concepta/app/features/search/data/data_sources/remote/search_remote_data_source_impl.dart';
import 'package:concepta/app/features/search/data/repositories/search_repository_impl.dart';
import 'package:concepta/app/features/search/domain/repositories/search_repository.dart';
import 'package:concepta/infra/db/core_recent_search_db.dart';
import 'package:pub_api_client/pub_api_client.dart';

import '../../../../../infra/injection/injection.dart';
import '../../presentation/bloc/animation/animation_cubit.dart';
import '../../presentation/bloc/suggestion/suggestion_cubit.dart';
import '../../presentation/screens/search_screen.dart';

class SearchModule implements CoreInjectionModule {
  @override
  void setDependencies(CoreInjector injector) {
    injector.singleton.inject<CoreRecentSearchDb>(
      dependency: const CoreRecentSearchDb(),
    );

    injector.singleton.inject<SearchRemoteDataSource>(
      dependency: SearchRemoteDataSourceImpl(
        client: PubClient(),
      ),
    );

    injector.singleton.inject<SearchLocalDataSource>(
      dependency: SearchLocalDataSourceImpl(
        coreRecentSearchDb: injector.get.dependency<CoreRecentSearchDb>(),
      ),
    );

    injector.singleton.inject<SearchRepository>(
      dependency: SearchRepositoryImpl(
        searchRemoteDataSource:
            injector.get.dependency<SearchRemoteDataSource>(),
        searchLocalDataSource: injector.get.dependency<SearchLocalDataSource>(),
      ),
    );

    injector.factory.inject<SearchAnimationCubit>(
      dependency: SearchAnimationCubit(),
    );

    injector.factory.inject<SearchSuggestionCubit>(
      dependency: SearchSuggestionCubit(
        searchRepository: injector.get.dependency<SearchRepository>(),
      ),
    );

    injector.factory.inject<SearchScreen>(
      dependency: SearchScreen(),
    );
  }
}
