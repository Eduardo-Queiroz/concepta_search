/// Abstraction that defines how get a dependency strategy.
///
/// Example of implementing a get dependency strategy using GetIt:
/// ```dart
///  class GetInjection implements CoreGetInjectionStrategy {
///    GetInjection({
///      required this.getIt,
///    });
///
///    final GetIt getIt;
///
///    @override
///    T dependency<T extends Object>() => getIt.get<T>();
///
///    @override
///    Future<T> asyncDependency<T extends Object>() => getIt.getAsync<T>();
///  }
/// ```
abstract class CoreGetInjectionStrategy {
  T dependency<T extends Object>();

  Future<T> asyncDependency<T extends Object>();
}
