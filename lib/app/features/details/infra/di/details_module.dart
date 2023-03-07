import 'package:concepta/app/features/details/data/data_sources/remote/details_remote_data_source_impl.dart';
import 'package:concepta/app/features/details/infra/routes/details.dart';
import 'package:pub_api_client/pub_api_client.dart';

import '../../../../../infra/injection/injection.dart';
import '../../data/data_sources/remote/details_remote_data_source.dart';
import '../../data/repositories/details_repository_impl.dart';
import '../../domain/repositories/search_repository.dart';
import '../../presentation/bloc/details/details_cubit.dart';
import '../../presentation/screens/details_screen.dart';

class DetailsModule implements CoreInjectionModule {
  @override
  void setDependencies(CoreInjector injector) {
    injector.singleton.inject<DetailsRemoteDataSource>(
      dependency: DetailsRemoteDataSourceImpl(
        client: PubClient(),
      ),
    );

    injector.singleton.inject<DetailRepository>(
      dependency: DetailRepositoryImpl(
        detailRemoteDataSource:
            injector.get.dependency<DetailsRemoteDataSource>(),
      ),
    );

    injector.factoryParam.inject<DetailsCubit, DetailsRoute, dynamic>(
      factory: (args, _) => DetailsCubit(
        detailRepository: injector.get.dependency<DetailRepository>(),
        route: args,
      ),
    );

    injector.factory.inject<DetailsScreen>(
      dependency: const DetailsScreen(),
    );
  }
}
