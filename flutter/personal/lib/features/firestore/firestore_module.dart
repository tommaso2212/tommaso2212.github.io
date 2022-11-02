import 'package:personal/features/authentication/authentication_module.dart';
import 'package:personal/features/firestore/application/firebase_manager.dart';
import 'package:personal/utils/service_locator/base_module.dart';
import 'package:personal/utils/service_locator/injectable/base_injectable.dart';

class FirestoreModule extends BaseModule {
  final _dependencies = [
    AuthenticationModule(),
  ];

  @override
  List<BaseModule> get dependencies => _dependencies;

  final _injectableList = [
    FirebaseManager(),
  ];

  @override
  List<BaseInjectable> get injectableList => _injectableList;
}
