import 'package:flutter/material.dart';
import 'package:personal_website/base/app_bar/base_app_bar.dart';
import 'package:personal_website/service/router/app_router.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    super.key,
    required this.slivers,
    this.appBarChildren = const [],
    this.floatingActionButton,
  });

  final List<Widget> appBarChildren;
  final List<Widget> slivers;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Title(
      title: AppRouter.getName(context),
      color: Colors.white,
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: AppDimensions.appBarHeight,
              title: BaseAppBar(children: appBarChildren),
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            ...slivers,
          ],
        ),
      ),
    );
  }
}
