import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:personal/core/authentication/model/role_enum.dart';

class User {
  
  RoleEnum? role;
  GoogleSignInAccount? googleSignInAccount;
  UserCredential? firebaseSignInAccount;
}