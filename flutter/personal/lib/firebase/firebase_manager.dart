import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal/firebase/firebase_options.dart';

class FirebaseManager {

  static FirebaseApp? _firebaseApp;

  static void initFirebase() async {
    _firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static FirebaseApp get app => _getAppThrowInitError();

  static FirebaseApp _getAppThrowInitError(){
    if(_firebaseApp == null){
      throw ErrorDescription("Instance of FirebaseApp must be initalized.");
    }
    return _firebaseApp!;
  }

}
