import 'package:get_it/get_it.dart';

import '../core_get_injection_strategy.dart';

class GetInjection implements CoreGetInjectionStrategy {
  GetInjection({
    required this.getIt,
  });

  final GetIt getIt;

  @override
  T dependency<T extends Object>() => getIt.get<T>();

  @override
  Future<T> asyncDependency<T extends Object>() => getIt.getAsync<T>();
}
