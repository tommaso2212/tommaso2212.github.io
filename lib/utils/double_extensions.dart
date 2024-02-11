import 'package:personal_website/utils/string_extensions.dart';

extension DoubleExtensions on double {
  String toEuros() {
    return toStringAsFixed(2).formatToEuros();
  }
}
