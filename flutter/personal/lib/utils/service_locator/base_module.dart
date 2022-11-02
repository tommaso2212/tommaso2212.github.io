import 'package:personal/utils/service_locator/injectable/base_injectable.dart';

abstract class BaseModule {

  List<BaseModule> get dependencies;
  List<BaseInjectable> get injectableList;

  void setup() {
    _handleDependencies();

    for (var injectable in injectableList) {
      injectable.registerInjectable();
    }
  }

  void _handleDependencies() {
    for (var module in dependencies) {
      module.setup();
    }
  }
}
