import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/base/scaffold/base_scaffold.dart';
import 'package:personal_website/pages/wordle/components/wordle_grid.dart';
import 'package:personal_website/pages/wordle/components/wordle_keyboard.dart';

class WordlePage extends ConsumerWidget {
  const WordlePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const BaseScaffold(
      child: WordleKeyboard(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WordleGrid(),
              
            ],
          ),
        ),
      ),
    );
  }
}
