import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal/features/firebase/data/firebase_auth.dart';
import 'package:personal/features/google/data/google_auth.dart';
import 'package:personal/features/users/application/user_provider.dart';

final loginProvider = StateNotifierProvider<LoginProvider, bool>(
  (ref) {
    var googleAuth = ref.read(googleAuthProvider);
    var firebaseAuth = ref.read(firebaseAuthProvider);
    var currentUserProvider = ref.read(userProvider.notifier);

    return LoginProvider(googleAuth, firebaseAuth, currentUserProvider);
  },
);

class LoginProvider extends StateNotifier<bool> {
  final GoogleAuth googleAuth;
  final FirebaseAuth firebaseAuth;
  final UserProvider userProvider;

  LoginProvider(this.googleAuth, this.firebaseAuth, this.userProvider) : super(false){
    login();
  }

  Future<void> login() async {
    try {
      await googleAuth.login();

      var googleAuthentication =
          await googleAuth.getCurrentUser()?.authentication;

      var credential = auth.GoogleAuthProvider.credential(
        idToken: googleAuthentication?.idToken,
        accessToken: googleAuthentication?.accessToken,
      );
      await firebaseAuth.login(credential);
      await userProvider.fetchUser();
      state = true;
    } catch (e) {
      state = state ? true : false;
      log(e.toString());
    }
  }

  Future<void> logout() async {
    try{
      await firebaseAuth.logout();
      await googleAuth.logout();
      userProvider.state = null;
      state = false;
    } catch (e){
      state = state ? true : false;
      log(e.toString());
    }
  }
}
