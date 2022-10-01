import 'package:flutter/material.dart';
import 'package:personal/core/firestore/model/user_data.dart';
import 'package:personal/core/firestore/user_service.dart';

class DrawerProvider extends ChangeNotifier {

  RoleEnum roleEnum = RoleEnum.public;

  void fetchRoleEnum() async {
    UserData? userData = await UserService.getUserData();

    roleEnum = userData != null ? userData.role : RoleEnum.public;
  }
}
