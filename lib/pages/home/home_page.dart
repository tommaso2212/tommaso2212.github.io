import 'package:flutter/material.dart';
import 'package:personal_website/base/scaffold/base_scaffold.dart';
import 'package:personal_website/pages/home/components/home_page_grid.dart';
import 'package:personal_website/pages/home/components/home_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      slivers: [
        HomeSearchBar(),
        HomePageGrid(),
      ],
    );
  }
}
