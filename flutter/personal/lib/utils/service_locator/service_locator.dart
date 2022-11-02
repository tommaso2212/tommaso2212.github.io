import 'package:get_it/get_it.dart';
import 'package:personal/utils/service_locator/base_module.dart';
import 'package:personal/utils/service_locator/injectable/base_injectable.dart';

export 'package:personal/utils/service_locator/base_module.dart';
export 'package:personal/utils/service_locator/injectable/base_injectable.dart';
export 'package:personal/utils/service_locator/service_locator.dart';

final serviceLocator = ServiceLocator();

class ServiceLocator {
  static final _getIt = GetIt.instance;

  void registerInjectable<T extends BaseInjectable>(T injectable) {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerSingleton<T>(injectable);
    }
  }

  T call<T extends BaseInjectable>() {
    return _getIt<T>();
  }

  void registerModule<T extends BaseModule>(T module) {
    module.setup();
  }
}
