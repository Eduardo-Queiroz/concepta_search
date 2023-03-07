import 'package:get_it/get_it.dart';

import '../../app/features/details/infra/di/details_module.dart';
import '../../app/features/search/infra/di/search_module.dart';
import '../injection/injection.dart';

final GetIt getIt = GetIt.instance;
final List<CoreInjectionModule> modules = [
  // DbModule(),
  SearchModule(),
  DetailsModule(),
];

Future<void> setupLocator() {
  final CoreInjector injector = InjectionManager(
    getInjectionStrategy: GetInjection(getIt: getIt),
    factoryStrategy: FactoryInjection(getIt: getIt),
    singletonStrategy: SingletonInjection(getIt: getIt),
    factoryParamStrategy: FactoryParamInjection(getIt: getIt),
  );

  for (final module in modules) {
    module.setDependencies(injector);
  }

  return getIt.allReady();
}
