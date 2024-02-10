import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class BaseExpansionTile extends StatefulWidget {
  const BaseExpansionTile({
    required this.title,
    required this.child,
    super.key,
  });

  final String title;
  final Widget child;

  @override
  State<BaseExpansionTile> createState() => _BaseExpansionTileState();
}

class _BaseExpansionTileState extends State<BaseExpansionTile> {
  bool expanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OutlinedButton(
          onPressed: () => setState(() {
            expanded = !expanded;
          }),
          style: OutlinedButtonTheme.of(context).style?.copyWith(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: AppDimensions.borderRadius),
                ),
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
              ),
              Icon(expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            ],
          ),
        ),
        if (expanded)
          Padding(
            padding: Dimension.medium.padding,
            child: widget.child,
          ),
      ],
    );
  }
}
