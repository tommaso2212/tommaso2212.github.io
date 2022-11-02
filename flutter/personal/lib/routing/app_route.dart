enum AppRoute { login, home }

extension AppRouteExtension on AppRoute {
  String toPath() {
    switch (this) {
      case AppRoute.login:
        return '/login';
      case AppRoute.home:
        return '/';
      default:
        return '';
    }
  }
}