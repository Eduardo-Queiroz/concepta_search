import 'package:concepta/app/features/details/data/data_sources/remote/details_remote_data_source_impl.dart';
import 'package:concepta/app/features/details/data/repositories/details_repository_impl.dart';
import 'package:concepta/app/features/details/domain/entities/detail.dart';
import 'package:concepta/app/features/details/infra/routes/details.dart';
import 'package:concepta/app/features/details/presentation/bloc/details/details_cubit.dart';
import 'package:concepta/app/features/details/presentation/bloc/details/details_state.dart';
import 'package:concepta/app/features/details/presentation/screens/details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/dependencies/pub_client.dart';
import '../../../../util/build_util.dart';

class DetailsSeeds {
  Future<void> build(
    WidgetTester tester, {
    required DetailsRoute route,
    DetailEntity? localData,
    DetailsState? initialState,
  }) async {
    await tester.pumpWidget(
      BuildUtil.buildTestableWidget<DetailsRoute>(
        const DetailsScreen(),
        providers: [
          BlocProvider<DetailsCubit>(
            lazy: false,
            create: (_) => DetailsCubit(
              route: route,
              detailRepository: DetailRepositoryImpl(
                detailRemoteDataSource: DetailsRemoteDataSourceImpl(
                  client: PubClientMock(),
                ),
              ),
              initialState: initialState,
            ),
          ),
        ],
      ),
    );
  }
}
