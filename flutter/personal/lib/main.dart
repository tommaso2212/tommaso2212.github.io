import 'package:flutter/material.dart';
import 'package:personal/core/firebase/firebase_manager.dart';
import 'package:personal/widgets/pages/home_page.dart';

void main() async {
  
  await FirebaseManager.initFirebase();

  runApp(const MaterialApp(
    title: 'Personal',
    home: HomePage(),
  ));
}