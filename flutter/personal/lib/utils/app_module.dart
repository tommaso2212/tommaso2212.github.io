import 'package:personal/features/google_workspace/google_workspace_module.dart';
import 'package:personal/features/home/home_module.dart';
import 'package:personal/features/users/user_module.dart';
import 'package:personal/utils/service_locator/base_module.dart';
import 'package:personal/utils/service_locator/injectable/base_injectable.dart';

class AppModule extends BaseModule {

  final _dependencies = [
        UserModule(),
        HomeModule(),
      ];

  @override
  List<BaseModule> get dependencies => _dependencies;

  final List<BaseInjectable> _injectableList = [];

  @override
  List<BaseInjectable> get injectableList => _injectableList;
}
