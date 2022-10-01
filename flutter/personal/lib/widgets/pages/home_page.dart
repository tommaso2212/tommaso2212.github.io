import 'package:flutter/material.dart';
import 'package:personal/widgets/base/drawer/drawer.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: PersonalMenu(),
      appBar: AppBar(),
      body: Container(),
    );
  }
  
}