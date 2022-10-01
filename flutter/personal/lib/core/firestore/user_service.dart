import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal/core/authentication/firebase_authentication.dart';
import 'package:personal/core/firebase/firebase_manager.dart';
import 'package:personal/core/firestore/model/user_data.dart';

class UserService {
  static Future<UserData?> getUserData() async {
    String? uid = FirebaseAuthentication.account.currentUser?.uid;

    DocumentSnapshot documentSnapshot =
        await FirebaseManager.db.collection('users').doc(uid).get();

    UserData? userData = UserData();

    try {
      userData.role = RoleEnum.values[documentSnapshot.get('role')];
    } catch (e) {
      userData = null;
    }
    return userData;
  }
}
