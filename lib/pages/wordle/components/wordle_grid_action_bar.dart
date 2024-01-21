import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/wordle/application/wordle_correct_word_provider.dart';
import 'package:personal_website/pages/wordle/application/wordle_game_provider.dart';
import 'package:personal_website/theme/app_dimensions.dart';

final wordleHideWordProvider = StateProvider<bool>((ref) {
  return true;
});

class WordleGridActionBar extends ConsumerWidget {
  const WordleGridActionBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hide = ref.watch(wordleHideWordProvider);
    return Padding(
      padding: EdgeInsets.only(bottom: Dimension.large.value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton.icon(
            onPressed: () => ref.read(wordleHideWordProvider.notifier).state = !hide,
            icon: const Icon(Icons.help_outline_outlined),
            label: Text(hide ? 'Show correct word' : ref.watch(wordleCorrectWordStateProvider)?.toUpperCase() ?? ''),
          ),
          FilledButton.icon(
            onPressed: () {
              ref.read(wordleGameProvider.notifier).initGame();
            },
            label: const Text('Reset'),
            icon: const Icon(Icons.replay_outlined),
          ),
        ],
      ),
    );
  }
}
