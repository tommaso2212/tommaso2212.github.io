import 'package:flutter/material.dart';

class SingletonUtils {
  static T getInstanceThrowInitError<T>(T? instance) {
    if (instance == null) {
      throw ErrorDescription("Instance must be initalized.");
    }
    return instance;
  }
}
