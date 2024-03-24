import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/base/app_bar/base_app_bar_path.dart';
import 'package:personal_website/base/scaffold/base_scaffold.dart';
import 'package:personal_website/pages/wordle/components/wordle_grid.dart';

import 'package:personal_website/service/router/app_router.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class WordlePage extends ConsumerWidget {
  const WordlePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffold(
      appBarChildren: [
        BaseAppBarPath(
          title: AppRouter.getName(context),
        ),
      ],
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(
            top: Dimension.small.value,
          ),
          sliver: const WordleGrid(),
        ),
      ],
    );
  }
}
