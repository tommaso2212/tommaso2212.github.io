import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    required this.child,
    this.color,
    this.border,
    super.key,
  });

  final Widget child;
  final Color? color;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimension.medium.horizontalPadding.copyWith(
        top: Dimension.small.value,
        bottom: Dimension.small.value,
      ),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).cardColor,
        borderRadius: AppDimensions.borderRadius,
        border: border,
      ),
      child: child,
    );
  }
}
