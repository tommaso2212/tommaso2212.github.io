import 'package:flutter/material.dart';
import 'package:personal/core/authentication/google_authentication.dart';
import 'package:personal/core/firestore/model/user_data.dart';
import 'package:personal/widgets/base/drawer/drawer_provider.dart';
import 'package:personal/widgets/login/components/profile.dart';
import 'package:provider/provider.dart';

class PersonalMenu extends StatelessWidget {

  final DrawerProvider _drawerProvider = DrawerProvider();

  PersonalMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: ChangeNotifierProvider.value(
              value: _drawerProvider,
              builder: (context, _) => Profile(
                  name: GoogleAuthentication.account.displayName!,
                  imageUrl: GoogleAuthentication.account.photoUrl!,
                  role: context.select<DrawerProvider, RoleEnum>((value) => value.roleEnum),
                ),
              
            ),
          ),
        ],
      ),
    );
  }
}
