import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/wordle/application/wordle_correct_word_provider.dart';
import 'package:personal_website/pages/wordle/application/wordle_game_provider.dart';
import 'package:personal_website/pages/wordle/application/wordle_words_provider.dart';
import 'package:personal_website/pages/wordle/components/wordle_grid_action_bar.dart';
import 'package:personal_website/pages/wordle/components/wordle_keyboard.dart';
import 'package:personal_website/pages/wordle/components/wordle_row.dart';
import 'package:personal_website/pages/wordle/utils/wordle_constants.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class WordleGrid extends ConsumerWidget {
  const WordleGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final correctWord = ref.watch(wordleCorrectWordStateProvider);
    var words = ref.watch(wordleWordsStateProvider);
    return SliverToBoxAdapter(
      child: UnconstrainedBox(
        child: SizedBox(
          width: WordleConstants.cellDimension * WordleConstants.maxWordLenght +
              WordleConstants.maxWordLenght * Dimension.small.value +
              Dimension.small.value * 2,
          child: Column(
            children: [
              const WordleGridActionBar(),
              WordleKeyboard(
                child: correctWord != null
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: AppDimensions.borderRadius,
                          border: Border.all(color: Theme.of(context).primaryColor),
                        ),
                        padding: Dimension.small.padding,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => WorldeRow(
                            wordToGuess: correctWord,
                            word: words.length > index ? words[index] : '',
                            isActive: ref.watch(wordleGameProvider) && index == words.length,
                          ),
                          separatorBuilder: (context, index) => Dimension.small.verticalSeparator,
                          itemCount: WordleConstants.maxWords,
                        ),
                      )
                    : const CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
