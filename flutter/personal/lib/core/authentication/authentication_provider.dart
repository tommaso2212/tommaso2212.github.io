import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal/core/local_storage/local_storage_web_manager.dart';

import 'authentication.dart';

abstract class AuthenticationProvider implements Authentication{

  Future<AuthCredential> get authCredential async {
    String? providerId = await LocalStorageWebManager().get('providerId');
    String? signInMethod = await LocalStorageWebManager().get('signInMethod');
    String? token = await LocalStorageWebManager().get('token');

    AuthCredential? credential;

    if(providerId == null || signInMethod == null || token == null){
      credential = await createAuthCredential();
      await LocalStorageWebManager().save(credential.asMap().cast());
    } else {
      credential = AuthCredential(providerId: providerId, signInMethod: signInMethod, token: int.tryParse(token));
    }

    return credential;
  }

  Future<AuthCredential> createAuthCredential();
}