import 'package:flutter/material.dart';
import 'package:personal/core/authentication/authentication.dart';
import 'package:personal/widgets/login/components/profile.dart';

class PersonalMenu extends StatelessWidget {
  const PersonalMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Profile(
                name: Authentication.user.googleSignInAccount!.displayName!,
                imageUrl: Authentication.user.googleSignInAccount!.photoUrl!,
                role: Authentication.user.role!,
                ),
          ),
        ],
      ),
    );
  }
}
