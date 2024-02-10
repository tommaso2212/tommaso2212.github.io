import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/home/application/home_page_grid_provider.dart';
import 'package:personal_website/pages/home/components/home_page_grid_element.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class HomePageGrid extends ConsumerWidget {
  const HomePageGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(homePageGridStateNotifier);
    return SliverPadding(
      padding: AppDimensions.getPagePadding(context).copyWith(
        top: Dimension.large.value,
        bottom: Dimension.large.value,
      ),
      sliver: SliverToBoxAdapter(
        child: Wrap(
          runSpacing: Dimension.large.value,
          spacing: Dimension.large.value,
          children: items
              .map(
                (e) => HomePageGridElement(
                  label: e.name ?? '',
                  routeName: e.name,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
