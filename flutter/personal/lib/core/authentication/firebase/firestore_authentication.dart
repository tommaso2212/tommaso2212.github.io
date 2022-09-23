import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal/core/authentication/authentication.dart';
import 'package:personal/core/authentication/model/role_enum.dart';
import 'package:personal/core/firebase/firebase_manager.dart';

class FirestoreAuthentication implements Authentication {
  @override
  Future<bool> get isSignedIn => Future.value(Authentication.user.role != null);

  @override
  Future<void> login() async {
    DocumentSnapshot doc = await FirebaseManager.db
        .collection("users")
        .doc(Authentication.user.firebaseSignInAccount?.user?.uid)
        .get();

    RoleEnum? role;
    try {
      role = RoleEnum.values.elementAt(doc.get("role") as int);
    } catch (e) {
      role = RoleEnum.public;
    }
    Authentication.user.role = role;
  }

  @override
  Future<void> logout() async {
    Authentication.user.role = null;
  }
}
