import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/service/inspect_code/presentation/inspectable_widget.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class HomePageGridElement extends StatelessWidget {
  const HomePageGridElement({
    required this.label,
    this.routeName,
    super.key,
  });
  final String? routeName;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InspectableWidget(
      path: 'lib/pages/home/components/home_page_grid_element.dart',
      child: Column(
        children: [
          FilledButton(
            style: FilledButtonTheme.of(context).style?.copyWith(
                  minimumSize: const MaterialStatePropertyAll(
                    Size(125, 125),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: AppDimensions.borderRadius,
                    ),
                  ),
                ),
            onPressed: routeName != null ? () => context.goNamed(routeName!) : null,
            child: Text(
              label.substring(0, 2).toUpperCase(),
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Dimension.small.value),
            child: Text(label),
          ),
        ],
      ),
    );
  }
}
