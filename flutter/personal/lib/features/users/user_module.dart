import 'package:personal/features/firestore/firestore_module.dart';
import 'package:personal/features/users/application/user_service.dart';
import 'package:personal/features/users/data/user_firestore_repository.dart';
import 'package:personal/utils/service_locator/base_module.dart';
import 'package:personal/utils/service_locator/injectable/base_injectable.dart';

class UserModule extends BaseModule {
  final _dependencies = [
    FirestoreModule(),
  ];

  @override
  List<BaseModule> get dependencies => _dependencies;

  final _injectableList = [
    UserFirestoreRepository.create(),
    UserService(),
  ];

  @override
  List<BaseInjectable> get injectableList => _injectableList;
}
