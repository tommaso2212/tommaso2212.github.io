import 'dart:html';

class LocalStorageWebManager {
  final Storage _localStorage = window.localStorage;

  Future<void> save(Map<String, String> properties) async {
    _localStorage.addAll(properties);
  }

  Future<String?> get(String property) async => _localStorage[property];

  Future invalidate(String property) async {
    _localStorage.remove(property);
  }
}