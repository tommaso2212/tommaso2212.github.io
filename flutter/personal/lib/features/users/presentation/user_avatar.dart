import 'package:flutter/material.dart';
import 'package:personal/constants/app_color.dart';
import 'package:personal/features/authentication/application/firebase_authentication.dart';
import 'package:personal/features/users/application/user_service.dart';
import 'package:personal/features/users/domain/user.dart';
import 'package:personal/routing/app_route.dart';
import 'package:personal/routing/app_routing.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

class UserAvatar extends StatelessWidget {

  void logout(BuildContext context) async {
    await serviceLocator<FirebaseAuthentication>().signOut();
    AppRouting.replace(context, AppRoute.login);
  }

  List<PopupMenuEntry<Widget>> buildMenu(BuildContext context, User user) {
    List<PopupMenuEntry<Widget>> menuEntry = List.of(
      [
        PopupMenuItem(
          enabled: false,
          child: Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                user.imageUrl,
              ),
            ),
          ),
        ),
        PopupMenuItem(
          enabled: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user.name,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              user.role == RoleEnum.admin
                  ? const Icon(
                      Icons.admin_panel_settings,
                      color: Colors.white,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        PopupMenuItem(
          enabled: false,
          child: Center(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: AppColor.primaryColor,
                ),
              ),
              onPressed: () => logout(context),
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
      growable: true,
    );

    if (user.role == RoleEnum.admin) {}

    return menuEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: FutureBuilder(
        future: serviceLocator<UserService>().getCurrentUser(),
        builder: (context, AsyncSnapshot<User> snapshot) {
          if (snapshot.hasData) {
    
            User user = snapshot.data!;
    
            return PopupMenuButton(
              elevation: 20,
              color: AppColor.sectionColor,
              tooltip: user.name,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  user.imageUrl,
                ),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              position: PopupMenuPosition.over,
              itemBuilder: (context) => buildMenu(context, user),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
