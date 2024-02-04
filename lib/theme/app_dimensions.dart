import 'package:flutter/material.dart';

class AppDimensions {
  static BorderRadius get borderRadius => BorderRadius.circular(8);
  static const double appBarHeight = 80.0;

  static EdgeInsets getPagePadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Device.of(context).on(
      onMobile: () => Dimension.large.horizontalPadding,
      onTablet: () => EdgeInsets.symmetric(horizontal: width / 6),
      orElse: () => EdgeInsets.symmetric(horizontal: width / 4),
    );
  }
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

enum Device {
  mobile(maxDeviceWidth: 600.0),
  tablet(maxDeviceWidth: 1200.0),
  dekstop();

  final double? maxDeviceWidth;
  const Device({this.maxDeviceWidth});

  static Device of(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Device.values.firstWhere(
      (element) => element.maxDeviceWidth != null ? width < element.maxDeviceWidth! : false,
      orElse: () => Device.dekstop,
    );
  }

  T on<T>({
    T Function()? onMobile,
    T Function()? onTablet,
    T Function()? onDesktop,
    required T Function() orElse,
  }) {
    switch (this) {
      case Device.mobile:
        return onMobile != null ? onMobile() : orElse();
      case Device.tablet:
        return onTablet != null ? onTablet() : orElse();
      case Device.dekstop:
        return onDesktop != null ? onDesktop() : orElse();
    }
  }
}
