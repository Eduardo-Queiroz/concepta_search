import 'package:get_it/get_it.dart';

import '../strategies/core_get_injection_strategy.dart';
import '../strategies/core_injection_param_strategy.dart';
import '../strategies/core_injection_strategy.dart';
import '../strategies/get_it/getIt_factory_injection_strategy.dart';
import '../strategies/get_it/getIt_factory_param_injection_strategy.dart';
import '../strategies/get_it/getIt_get_injection_strategy.dart';
import '../strategies/get_it/getIt_singleton_injection_strategy.dart';
import 'core_injector.dart';

class InjectionManager implements CoreInjector {
  InjectionManager({
    CoreGetInjectionStrategy? getInjectionStrategy,
    CoreInjectionStrategy? factoryStrategy,
    CoreInjectionParamStrategy? factoryParamStrategy,
    CoreInjectionStrategy? singletonStrategy,
  })  : get = getInjectionStrategy ?? GetInjection(getIt: GetIt.instance),
        factory = factoryStrategy ?? FactoryInjection(getIt: GetIt.instance),
        factoryParam = factoryParamStrategy ??
            FactoryParamInjection(getIt: GetIt.instance),
        singleton =
            singletonStrategy ?? SingletonInjection(getIt: GetIt.instance);

  @override
  final CoreInjectionStrategy factory;

  @override
  final CoreInjectionParamStrategy factoryParam;

  @override
  final CoreInjectionStrategy singleton;

  @override
  final CoreGetInjectionStrategy get;
}
