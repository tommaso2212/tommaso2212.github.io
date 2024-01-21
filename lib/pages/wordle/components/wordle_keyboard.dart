import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/wordle/application/wordle_game_provider.dart';
import 'package:personal_website/pages/wordle/utils/wordle_constants.dart';

final wordleCurrentWordProvider = StateProvider<String>((ref) => '');

class WordleKeyboard extends ConsumerWidget {
  final Widget child;
  const WordleKeyboard({super.key, required this.child});

  void handleKeyEvent(WidgetRef ref, RawKeyEvent event) {
    final currentWord = ref.read(wordleCurrentWordProvider);
    if (LogicalKeyboardKey.backspace == event.data.logicalKey && currentWord.isNotEmpty) {
      ref.read(wordleCurrentWordProvider.notifier).state = currentWord.substring(0, currentWord.length - 1);
    } else if (LogicalKeyboardKey.enter == event.data.logicalKey &&
        currentWord.length == WordleConstants.maxWordLenght) {
      ref.read(wordleGameProvider.notifier).addWord(currentWord);
      ref.read(wordleCurrentWordProvider.notifier).state = '';
    } else if (!LogicalKeyboardKey.isControlCharacter(event.data.logicalKey.keyLabel) &&
        event.character != null &&
        event.character != ' ' &&
        currentWord.length < WordleConstants.maxWordLenght) {
      ref.read(wordleCurrentWordProvider.notifier).state = currentWord + event.character!;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isInGame = ref.watch(wordleGameProvider);
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (value) => isInGame && (value is RawKeyDownEvent) ? handleKeyEvent(ref, value) : {},
      child: child,
    );
  }
}
