import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/base/app_bar/base_app_bar_path.dart';
import 'package:personal_website/base/scaffold/base_scaffold.dart';
import 'package:personal_website/service/router/app_router.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

  static final items = [
    AppRouter.restaurantMenuRoute,
    AppRouter.restaurantOrderListRoute,
    AppRouter.restaurantDishListPage,
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarChildren: [
        BaseAppBarPath(
          title: AppRouter.getName(context),
        ),
      ],
      slivers: [
        SliverPadding(
          padding: AppDimensions.getPagePadding(context).copyWith(
            top: Dimension.large.value,
          ),
          sliver: SliverList.separated(
            itemCount: items.length,
            itemBuilder: (context, index) => _RestaurantButton(route: items[index]),
            separatorBuilder: (context, index) => Dimension.large.verticalSeparator,
          ),
        ),
      ],
    );
  }
}

class _RestaurantButton extends StatelessWidget {
  const _RestaurantButton({
    required this.route,
  });

  final GoRoute route;

  IconData getIcon() {
    if (AppRouter.restaurantMenuRoute == route) {
      return Icons.menu_book;
    } else if (AppRouter.restaurantOrderListRoute == route) {
      return Icons.shopping_cart_outlined;
    } else if (AppRouter.restaurantDishListPage == route) {
      return Icons.soup_kitchen;
    }
    return Icons.abc;
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => context.goNamed(route.name!),
      style: FilledButtonTheme.of(context).style?.copyWith(
            padding: MaterialStatePropertyAll(Dimension.medium.padding),
          ),
      child: Column(
        children: [
          Icon(getIcon(), size: Dimension.large.value),
          Text(
            route.name!,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ],
      ),
    );
  }
}
