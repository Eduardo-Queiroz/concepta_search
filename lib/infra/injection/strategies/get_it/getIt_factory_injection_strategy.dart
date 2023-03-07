import 'package:get_it/get_it.dart';

import '../core_injection_strategy.dart';

class FactoryInjection implements CoreInjectionStrategy {
  FactoryInjection({
    required this.getIt,
  });

  final GetIt getIt;

  @override
  void inject<T extends Object>({
    required T dependency,
  }) =>
      getIt.registerFactory<T>(() => dependency);
}
