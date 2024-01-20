import 'package:flutter/material.dart';

class AppDimensions {
  static BorderRadius get borderRadius => BorderRadius.circular(8);
}

enum Dimension {
  small(10.0),
  medium(20.0),
  large(40.0);

  final double value;
  const Dimension(this.value);
}

extension DimensionUtility on Dimension {
  EdgeInsets get padding => EdgeInsets.all(value);
  EdgeInsets get horizontalPadding => EdgeInsets.symmetric(horizontal: value);
  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: value);
  SizedBox get horizontalSeparator => SizedBox(width: value);
  SizedBox get verticalSeparator => SizedBox(height: value);
}
