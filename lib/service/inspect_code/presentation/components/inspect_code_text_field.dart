import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class InspectCodeTextField extends ConsumerWidget {
  const InspectCodeTextField({required this.code, super.key});

  final String code;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onTertiary,
        borderRadius: AppDimensions.borderRadius,
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      padding: Dimension.small.padding,
      child: Stack(
        children: [
          SelectableText(
            code,
            style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          ),
          Positioned(
            right: 0,
            child: IconButton.outlined(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.surface,
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: AppDimensions.borderRadius,
                  ),
                ),
              ),
              onPressed: () => Clipboard.setData(
                ClipboardData(text: code),
              ),
              icon: const Icon(Icons.copy),
            ),
          ),
        ],
      ),
    );
  }
}
