import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/wordle/application/wordle_words_provider.dart';
import 'package:personal_website/pages/wordle/components/wordle_row.dart';

class WordleKeyboard extends ConsumerWidget {
  final Widget child;
  const WordleKeyboard({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (value) {
        var isInGame = ref.read(wordleWordsStateProvider.notifier).isInGame;
        if (value is RawKeyUpEvent || !isInGame) return;
        var currentWord = ref.read(wordleCurrentWordProvider);
        if (LogicalKeyboardKey.backspace == value.data.logicalKey && currentWord.isNotEmpty) {
          ref.read(wordleCurrentWordProvider.notifier).state = currentWord.substring(0, currentWord.length - 1);
        } else if (LogicalKeyboardKey.enter == value.data.logicalKey && currentWord.length == 5) {
          ref.read(wordleWordsStateProvider.notifier).addWord(currentWord);
          ref.read(wordleCurrentWordProvider.notifier).state = '';
        } else if (!LogicalKeyboardKey.isControlCharacter(value.data.logicalKey.keyLabel) &&
            value.character != null &&
            value.character != ' ' &&
            currentWord.length < 5) {
          ref.read(wordleCurrentWordProvider.notifier).state = currentWord + value.character!;
        }
      },
      child: child,
    );
  }
}
