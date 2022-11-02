import 'package:personal/features/google_workspace/google_workspace_module.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

class BookReaderModule extends BaseModule {
  final _dependencies = <BaseModule> [
    GoogleWorkspaceModule(),
  ];

  @override
  List<BaseModule> get dependencies => _dependencies;

  final _injectableList = <BaseInjectable>[];

  @override
  List<BaseInjectable> get injectableList => _injectableList;
}