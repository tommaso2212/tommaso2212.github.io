import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:personal/features/authentication/application/firebase_authentication.dart';
import 'package:personal/features/firestore/application/firebase_options.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

abstract class FirebaseManager extends BaseInjectable {
  factory FirebaseManager() => _FirebaseManager();

  Future<void> initFirebase();

  Future<bool> isInitialized();

  FirebaseFirestore get firestore;
}

class _FirebaseManager implements FirebaseManager {
  FirebaseApp? app;
  bool isInit = false;

  @override
  Future<void> initFirebase() async {
    app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    if (!await serviceLocator<FirebaseAuthentication>().isAuthenticated()) {
      await serviceLocator<FirebaseAuthentication>().signIn();
    }
  }

  @override
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @override
  void registerInjectable() {
    serviceLocator.registerInjectable<FirebaseManager>(this);
  }

  @override
  Future<bool> isInitialized() async {
    if (app == null) {
      await initFirebase();
    }
    return app != null;
  }
}
