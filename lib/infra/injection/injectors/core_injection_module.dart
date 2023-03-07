import 'core_injector.dart';

/// Abstraction that defines a injection module.
///
/// An injection module is where we declare all dependencies for a
/// specific scope of functionality.
///
/// Example of creating two different functionality injection modules:
/// ```dart
///   class HomeModule implements CoreInjectionModule {
///     @override
///     void setDependencies(CoreInjector injector) {
///       injector.factory.inject<HomeScreen>(dependency: HomeScreen());
///       injector.singleton.inject<HomeCubit>(dependency: HomeCubit());
///       // other dependencies...
///     }
///   }
///
///  class ProfileModule implements CoreInjectionModule {
///     @override
///     void setDependencies(CoreInjector injector) {
///       injector.factory.inject<ProfileScreen>(dependency: ProfileScreen());
///       injector.singleton.inject<ProfileCubit>(dependency: ProfileCubit());
///       // other dependencies...
///     }
///   }
/// ```
abstract class CoreInjectionModule {

  /// Called to set the dependencies declared in this module.
  void setDependencies(CoreInjector injector);
}
