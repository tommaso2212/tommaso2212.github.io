import 'package:flutter/material.dart';
import 'package:personal_website/base/app_bar/base_app_bar.dart';
import 'package:personal_website/service/router/app_router.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    super.key,
    required this.body,
    this.appBarChildren = const [],
  });

  final List<Widget> appBarChildren;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Title(
      title: AppRouter.getName(context),
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: BaseAppBar(children: appBarChildren),
          centerTitle: false,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: body,
      ),
    );
  }
}
