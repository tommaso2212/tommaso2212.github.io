import 'package:flutter/material.dart';
import 'package:personal/constants/app_color.dart';
import 'package:personal/features/users/domain/user.dart';

class UserCirlceAvatar extends StatelessWidget {
  final User user;
  final void Function()? onLogout;

  const UserCirlceAvatar({super.key, required this.user, this.onLogout});

  List<PopupMenuEntry<Widget>> buildMenu(BuildContext context, User user) {
    List<PopupMenuEntry<Widget>> menuEntry = List.of(
      [
        PopupMenuItem(
          enabled: false,
          child: Center(
            child: CircleAvatar(
              backgroundImage: user.imageUrl != null
                  ? NetworkImage(
                      user.imageUrl!,
                    )
                  : null,
            ),
          ),
        ),
        PopupMenuItem(
          enabled: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              user.name != null ? Text(
                user.name!,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ) : const SizedBox.shrink(),
              user.role == UserRole.admin
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
              onPressed: onLogout,
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

    if (user.role == UserRole.admin) {
      // TODO: admin only
    }

    return menuEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: PopupMenuButton(
        elevation: 20,
        color: AppColor.sectionColor,
        tooltip: user.name,
        child: CircleAvatar(
          backgroundImage: user.imageUrl != null
              ? NetworkImage(
                  user.imageUrl!,
                )
              : null,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        position: PopupMenuPosition.over,
        itemBuilder: (context) => buildMenu(context, user),
      ),
    );
  }
}
