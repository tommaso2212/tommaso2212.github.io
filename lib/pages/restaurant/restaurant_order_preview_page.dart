import 'package:flutter/material.dart';
import 'package:personal_website/base/app_bar/base_app_bar_path.dart';
import 'package:personal_website/base/scaffold/base_scaffold.dart';
import 'package:personal_website/pages/restaurant/components/common/restaurant_order_check.dart';
import 'package:personal_website/pages/restaurant/components/common/restaurant_order_info.dart';
import 'package:personal_website/pages/restaurant/components/order_preview/restaurant_order_preview_confim_button.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_order.dart';
import 'package:personal_website/service/router/app_router.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class RestaurantOrderPreviewPage extends StatelessWidget {
  const RestaurantOrderPreviewPage({
    required this.order,
    super.key,
  });

  final RestaurantOrder order;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      isBack: true,
      appBarChildren: [
        BaseAppBarPath(
          title: AppRouter.getName(context),
        ),
        if (order.id != null)
          BaseAppBarPath(
            title: 'N. ${order.id}',
          ),
      ],
      slivers: [
        SliverPadding(
          padding: AppDimensions.getPagePadding(context),
          sliver: SliverToBoxAdapter(
            child: RestaurantOrderInfo(
              order: order,
              builder: (context, dishes) => RestaurantOrderCheck(dishes: dishes),
            ),
          ),
        ),
      ],
      floatingActionButton: RestaurantOrderPreviewConfirmButton(
        order: order,
      ),
    );
  }
}
