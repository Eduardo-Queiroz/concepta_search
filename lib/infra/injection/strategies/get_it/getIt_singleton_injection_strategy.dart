import 'package:get_it/get_it.dart';

import '../core_injection_strategy.dart';

class SingletonInjection implements CoreInjectionStrategy {
  SingletonInjection({
    required this.getIt,
  });

  final GetIt getIt;

  @override
  void inject<T extends Object>({
    required T dependency,
  }) =>
      getIt.registerSingleton<T>(dependency);
}
