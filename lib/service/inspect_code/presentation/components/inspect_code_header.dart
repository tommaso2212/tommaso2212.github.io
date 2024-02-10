import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InspectCodeHeader extends StatelessWidget {
  const InspectCodeHeader({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title),
        IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.close,
            size: 32,
          ),
        ),
      ],
    );
  }
}
