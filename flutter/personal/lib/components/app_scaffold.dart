import 'package:flutter/material.dart';
import 'package:personal/constants/app_color.dart';
import 'package:personal/features/users/application/user_service.dart';
import 'package:personal/features/users/domain/user.dart';
import 'package:personal/features/users/presentation/user_avatar.dart';
import 'package:personal/routing/app_routing.dart';
import 'package:personal/utils/service_locator/service_locator.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final List<Widget> appBarActions;

  const AppScaffold(
      {Key? key, required this.child, this.appBarActions = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          ...appBarActions,
          UserAvatar(),
        ],
      ),
      body: child,
    );
  }
}
