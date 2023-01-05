enum AppRoute {
  login('Login', '/login'),
  home('Home', '/');

  final String name;
  final String path;
  const AppRoute(this.name, this.path);
}
