import 'package:flutter/material.dart';
import 'package:personal_website/service/inspect_code/presentation/inspectable_widget.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class BaseAppBarPath extends StatelessWidget {
  const BaseAppBarPath({
    required this.title,
    this.onTap,
    super.key,
  });

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InspectableWidget(
      path: 'lib/base/app_bar/base_app_bar_path.dart',
      child: Row(
        children: [
          Padding(
            padding: Dimension.small.horizontalPadding,
            child: const Text('/'),
          ),
          OutlinedButton(
            onPressed: onTap,
            child: Text(title),
          ),
        ],
      ),
    );
  }
}
