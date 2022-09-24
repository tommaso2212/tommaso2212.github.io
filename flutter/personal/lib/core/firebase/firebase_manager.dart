import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal/core/authentication/authentication_provider.dart';
import 'package:personal/core/authentication/firebase/firebase_authentication.dart';
import 'package:personal/core/firebase/firebase_options.dart';

class FirebaseManager {

  static FirebaseApp? _firebaseApp;
  static FirebaseFirestore? _firebaseFirestore;

  static Future<void> initFirebase(AuthenticationProvider authenticationProvider) async {
    _firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    _firebaseFirestore = FirebaseFirestore.instance;

    await FirebaseAuthentication(authenticationProvider).login();
  }

  static Future<void> signInWithLocalStorage() async {
    
  }

  static FirebaseApp get app => _getInstanceThrowInitError<FirebaseApp>(_firebaseApp);

  static FirebaseFirestore get db => _getInstanceThrowInitError<FirebaseFirestore>(_firebaseFirestore);

  static T _getInstanceThrowInitError<T>(T? instance){
    if(instance == null){
      throw ErrorDescription("Instance must be initalized.");
    }
    return instance;
  }
}
