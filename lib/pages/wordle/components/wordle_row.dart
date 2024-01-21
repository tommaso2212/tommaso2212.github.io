import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/wordle/components/wordle_cell.dart';
import 'package:personal_website/pages/wordle/components/wordle_keyboard.dart';
import 'package:personal_website/pages/wordle/utils/wordle_constants.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class WorldeRow extends ConsumerWidget {
  final String word;
  final String wordToGuess;
  final bool isActive;
  const WorldeRow({super.key, required this.word, required this.wordToGuess, required this.isActive});

  WordleCellStatus getStatus(String character, int index, String wordToGuess, bool isActive) {
    if (isActive) return WordleCellStatus.active;
    if (character == '') return WordleCellStatus.disabled;
    if (character == wordToGuess[index]) return WordleCellStatus.correct;
    if (wordToGuess.contains(character)) return WordleCellStatus.wrongPosition;
    return WordleCellStatus.disabled;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var characters = (isActive ? ref.watch(wordleCurrentWordProvider) : word)
        .padRight(
          WordleConstants.maxWordLenght,
          ' ',
        )
        .split('');
    return UnconstrainedBox(
      child: SizedBox(
        height: WordleConstants.cellDimension,
        width: WordleConstants.maxWordLenght * WordleConstants.cellDimension +
            (WordleConstants.maxWordLenght - 1) * Dimension.small.value,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => WordleCell(
            character: characters[index],
            status: getStatus(characters[index], index, wordToGuess, isActive),
          ),
          separatorBuilder: (context, index) => Dimension.small.horizontalSeparator,
          itemCount: WordleConstants.maxWordLenght,
        ),
      ),
    );
  }
}
