/// For Factories that expect up to two parameters if you need only one use
/// `void` for the one you don't use
typedef FactoryFuncParam<T, P1, P2> = T Function(
  P1 param1,
  P2 param2,
);

/// Abstraction that defines a dependency injection strategy.
///
/// Example of implementing a factory injection strategy using GetIt:
/// ```dart
///   class FactoryInjection implements CoreInjectionStrategy {
///     FactoryInjection({
///       required this.getIt,
///     });
///
///     final GetIt getIt;
///
///     @override
///     void inject<T extends Object>({
///       required T dependency,
///     }) => getIt.registerFactory<T>(() => dependency);
///   }
/// ```
abstract class CoreInjectionParamStrategy {
  void inject<T extends Object, P1 extends Object, P2 extends dynamic>({
    required FactoryFuncParam<T, P1, P2> factory,
  });
}
