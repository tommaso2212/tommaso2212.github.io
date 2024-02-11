import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/base/app_bar/base_app_bar_path.dart';
import 'package:personal_website/base/scaffold/base_scaffold.dart';
import 'package:personal_website/pages/restaurant/components/dish_list/restaurant_dish_list.dart';
import 'package:personal_website/service/router/app_router.dart';

class RestaurantDishListPage extends StatelessWidget {
  const RestaurantDishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarChildren: [
        BaseAppBarPath(
          title: AppRouter.restaurantRoute.name!,
          onTap: () => context.goNamed(AppRouter.restaurantRoute.name!),
        ),
        BaseAppBarPath(
          title: AppRouter.getName(context),
        ),
      ],
      slivers: const [
        RestaurantDishList(),
      ],
    );
  }
}
