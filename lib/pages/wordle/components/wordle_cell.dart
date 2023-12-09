import 'package:flutter/material.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class WordleCell extends StatelessWidget {
  final WordleCellStatus status;
  final String character;
  const WordleCell({super.key, required this.status, required this.character});

  Color getStatusColor(BuildContext context, WordleCellStatus status) {
    switch (status) {
      case WordleCellStatus.active:
        return Theme.of(context).focusColor;
      case WordleCellStatus.wrongPosition:
        return Colors.yellow;
      case WordleCellStatus.correct:
        return Colors.green;

      default:
        return Theme.of(context).cardColor;
    }
  }

  TextStyle? getTextStyle(BuildContext context, WordleCellStatus status) {
    var style = Theme.of(context).textTheme.bodyLarge;
    if (status == WordleCellStatus.wrongPosition) style = style?.copyWith(color: Colors.black);
    return style;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppDimensions.borderRadius,
        color: getStatusColor(context, status),
      ),
      width: 80,
      height: 80,
      child: Center(
        child: Text(
          character.toUpperCase(),
          style: getTextStyle(context, status),
        ),
      ),
    );
  }
}

enum WordleCellStatus {
  disabled,
  active,
  wrongPosition,
  correct;
}
