import 'package:flutter/material.dart';

class AppDimensions {
  static BorderRadius get borderRadius => BorderRadius.circular(8);

  static SizedBox getHorizontalSeparator(Dimension dimension) => SizedBox(width: dimension.value);
  static SizedBox getVerticalSeparator(Dimension dimension) => SizedBox(height: dimension.value);

  static EdgeInsets getPadding(Dimension dimension) => EdgeInsets.all(dimension.value);
}

enum Dimension {
  small(10.0),
  medium(20.0),
  large(40.0);

  final double value;
  const Dimension(this.value);
}
