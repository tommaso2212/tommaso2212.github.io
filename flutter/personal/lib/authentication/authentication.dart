import 'package:personal/authentication/model/user.dart';

abstract class Authentication {

  static final User user = User();

  Future<void> login();

  void logout();

  Future<bool> get isSignedIn;
}

