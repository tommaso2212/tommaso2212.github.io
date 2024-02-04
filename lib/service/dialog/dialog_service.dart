import 'package:flutter/material.dart';
import 'package:personal_website/service/router/app_router.dart';

class DialogService {
  static BuildContext? get _context => AppRouter.navigatorKey.currentContext;

  static Future<T?> openDialog<T>({
    required Widget Function(BuildContext context) builder,
  }) {
    if (_context != null) {
      return showDialog<T>(
        context: _context!,
        builder: builder,
      );
    }
    throw Exception("Cannot open dialog.");
  }
}
