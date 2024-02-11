import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/restaurant/application/restaurant_order_list_provider.dart';
import 'package:personal_website/pages/restaurant/domain/model/restaurant_order.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class RestaurantOrderFilter extends ConsumerWidget {
  const RestaurantOrderFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(orderStatusStateProvider);

    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => FilterChip(
          selected: RestaurantOrderStatus.values[index] == status,
          label: Text(RestaurantOrderStatus.values[index].label),
          onSelected: (value) =>
              ref.read(orderStatusStateProvider.notifier).state = RestaurantOrderStatus.values[index],
        ),
        separatorBuilder: (context, index) => Dimension.small.horizontalSeparator,
        itemCount: RestaurantOrderStatus.values.length,
      ),
    );
  }
}
