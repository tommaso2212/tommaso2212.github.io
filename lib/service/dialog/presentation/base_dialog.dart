import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    required this.child,
    this.title,
    super.key,
  });

  final Widget? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          if (title != null)
            Padding(
              padding: Dimension.large.padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: Dimension.medium.value,
                    ),
                    child: title!,
                  ),
                  child,
                ],
              ),
            )
          else
            Padding(
              padding: Dimension.large.padding.copyWith(
                top: Dimension.medium.value + IconTheme.of(context).size! * 2,
              ),
              child: child,
            ),
          Positioned(
            right: Dimension.medium.value,
            top: Dimension.medium.value,
            child: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(
                Icons.close,
              ),
            ),
          )
        ],
      ),
    );
  }
}
