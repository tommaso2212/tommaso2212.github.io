import 'package:personal/features/authentication/application/firebase_authentication.dart';
import 'package:personal/features/authentication/application/google_authentication.dart';
import 'package:personal/utils/service_locator/base_module.dart';
import 'package:personal/utils/service_locator/injectable/base_injectable.dart';

class AuthenticationModule extends BaseModule {
  
  @override
  List<BaseModule> get dependencies => [];
  
  final googleAuthentication = GoogleAuthentication();
  final firebaseAuthentication = FirebaseAuthentication();

  @override
  List<BaseInjectable> get injectableList => [
    googleAuthentication,
    firebaseAuthentication,
  ];
}
