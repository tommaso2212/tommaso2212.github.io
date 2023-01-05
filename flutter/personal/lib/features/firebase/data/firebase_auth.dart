import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal/features/firebase/data/firebase_options.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => _FirebaseAuthImpl(),
);

abstract class FirebaseAuth {
  Future<void> init();
  Future<void> login(auth.OAuthCredential credential);
  Future<void> logout();
}

class _FirebaseAuthImpl implements FirebaseAuth {
  FirebaseApp? app;

  @override
  Future<void> init() async {
    app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Future<void> login(auth.OAuthCredential credential) async {
    if (app == null) {
      await init();
    }
    await auth.FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> logout() async {
    await auth.FirebaseAuth.instance.signOut();
  }
}
