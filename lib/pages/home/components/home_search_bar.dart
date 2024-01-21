import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/home/application/home_page_grid_provider.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class HomeSearchBar extends ConsumerStatefulWidget {
  const HomeSearchBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends ConsumerState<HomeSearchBar> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    controller.addListener(() {
      ref.read(homePageGridStateNotifier.notifier).filterRoutes(controller.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: AppDimensions.getPagePadding(context).copyWith(top: Dimension.large.value),
      sliver: SliverToBoxAdapter(
        child: SearchBar(
          controller: controller,
          hintText: 'Search',
          padding: MaterialStatePropertyAll(Dimension.medium.horizontalPadding),
          leading: const Icon(Icons.search_rounded),
        ),
      ),
    );
  }
}
