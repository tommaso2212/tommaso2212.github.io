import 'package:flutter/material.dart';
import 'package:personal/widgets/base/personal_menu.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PersonalMenu(),
      appBar: AppBar(),
      body: Container(),
    );
  }
  
}