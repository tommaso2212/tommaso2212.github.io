import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:personal/core/authentication/firebase_authentication.dart';
import 'package:personal/core/firebase/firebase_options.dart';
import 'package:personal/core/utils/singleton_utils.dart';

class FirebaseManager {

  static FirebaseApp? _firebaseApp;
  static FirebaseFirestore? _firebaseFirestore;

  static Future<void> initFirebase() async {
    _firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    _firebaseFirestore = FirebaseFirestore.instanceFor(app: _firebaseApp!);

    await FirebaseAuthentication.login();

    
  }

  static FirebaseFirestore get db => SingletonUtils.getInstanceThrowInitError(_firebaseFirestore);
}
