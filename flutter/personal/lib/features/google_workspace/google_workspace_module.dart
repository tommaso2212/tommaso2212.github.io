import 'package:personal/features/authentication/authentication_module.dart';
import 'package:personal/features/google_workspace/data/google_drive_manager.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

class GoogleWorkspaceModule extends BaseModule {
  final _dependencies = [
    AuthenticationModule(),
  ];

  @override
  List<BaseModule> get dependencies => _dependencies;

  final _injectableList = [
    GoogleDriveManager(),
  ];

  @override
  List<BaseInjectable> get injectableList => _injectableList;
}
