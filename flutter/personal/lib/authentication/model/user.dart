import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:personal/authentication/model/role_enum.dart';

class User {
  
  RoleEnum role = RoleEnum.public;

  GoogleSignInAccount? googleSignInAccount;
  UserCredential? firebaseSignInAccount;
}