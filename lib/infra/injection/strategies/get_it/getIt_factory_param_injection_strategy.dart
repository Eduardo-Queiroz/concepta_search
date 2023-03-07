import 'package:get_it/get_it.dart' show GetIt;

import '../core_injection_param_strategy.dart';

class FactoryParamInjection implements CoreInjectionParamStrategy {
  FactoryParamInjection({
    required this.getIt,
  });

  final GetIt getIt;

  @override
  void inject<T extends Object, P1 extends Object, P2 extends dynamic>({
    required FactoryFuncParam<T, P1, P2> factory,
  }) =>
      getIt.registerFactoryParam(factory);
}
