import 'package:concepta/infra/injection/injection.dart';

class DbModule implements CoreInjectionModule {
  @override
  void setDependencies(CoreInjector injector) {
    // injector.singleton.inject<CoreVaultDb>(
    //   dependency: const CoreVaultDb(),
    // );
  }
}
