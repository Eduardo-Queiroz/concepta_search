import 'package:concepta/app/features/search/data/data_sources/local/search_local_data_source_impl.dart';
import 'package:concepta/app/features/search/data/data_sources/remote/search_remote_data_source_impl.dart';
import 'package:concepta/app/features/search/data/repositories/search_repository_impl.dart';
import 'package:concepta/app/features/search/domain/entities/suggestion.dart';
import 'package:concepta/app/features/search/infra/routes/search.dart';
import 'package:concepta/app/features/search/presentation/bloc/animation/animation_cubit.dart';
import 'package:concepta/app/features/search/presentation/bloc/animation/animation_state.dart';
import 'package:concepta/app/features/search/presentation/bloc/suggestion/suggestion_cubit.dart';
import 'package:concepta/app/features/search/presentation/bloc/suggestion/suggestion_state.dart';
import 'package:concepta/app/features/search/presentation/screens/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/db/db_mock.dart';
import '../../../../mocks/dependencies/pub_client.dart';
import '../../../../util/build_util.dart';

class SearchSeeds {
  Future<void> build(
    WidgetTester tester, {
    SuggestionEntity? localData,
    SearchSuggestionState? initialSuggestionState,
    SearchAnimationState? initialAnimationState,
  }) async {
    await tester.pumpWidget(
      BuildUtil.buildTestableWidget<SearchRoute>(
        SearchScreen(),
        providers: [
          BlocProvider<SearchAnimationCubit>(
            lazy: false,
            create: (_) => SearchAnimationCubit(
              initialState: initialAnimationState,
            ),
          ),
          BlocProvider<SearchSuggestionCubit>(
            lazy: false,
            create: (_) => SearchSuggestionCubit(
              searchRepository: SearchRepositoryImpl(
                searchLocalDataSource: SearchLocalDataSourceImpl(
                  coreRecentSearchDb: CoreRecentSearchDbMock(
                    localData,
                  ),
                ),
                searchRemoteDataSource: SearchRemoteDataSourceImpl(
                  client: PubClientMock(),
                ),
              ),
              initialState: initialSuggestionState,
            ),
          ),
        ],
      ),
    );
  }
}
