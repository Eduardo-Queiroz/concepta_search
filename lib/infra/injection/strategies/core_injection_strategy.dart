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
abstract class CoreInjectionStrategy {
  void inject<T extends Object>({
    required T dependency,
  });
}