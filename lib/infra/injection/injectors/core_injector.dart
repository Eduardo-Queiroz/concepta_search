import '../strategies/core_get_injection_strategy.dart';
import '../strategies/core_injection_param_strategy.dart';
import '../strategies/core_injection_strategy.dart';

/// Abstraction that defines a injector.
///
/// The injector is responsible for concentrating all dependency injection
/// and capture strategies in a single class.
abstract class CoreInjector {
  /// Called to inject a new dependency with the factory strategy.
  CoreInjectionStrategy get factory;

  /// Called to inject a new dependency with the factory strategy with params.
  CoreInjectionParamStrategy get factoryParam;

  /// Called to inject a new dependency with the singleton strategy.
  CoreInjectionStrategy get singleton;

  /// Called to get a dependency that was previously injected.
  CoreGetInjectionStrategy get get;
}
