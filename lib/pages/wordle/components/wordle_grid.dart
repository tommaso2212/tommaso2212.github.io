import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/wordle/application/wordle_words_provider.dart';
import 'package:personal_website/pages/wordle/components/wordle_row.dart';
import 'package:personal_website/theme/app_dimensions.dart';

class WordleGrid extends ConsumerWidget {
  const WordleGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var words = ref.watch(wordleWordsStateProvider);
    return Container(
      padding: AppDimensions.getPadding(Dimension.medium),
      decoration: BoxDecoration(
        borderRadius: AppDimensions.borderRadius,
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),
      width: 80 * 5 + 20 * 4,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => SizedBox(
          height: 80,
          child: WorldeRow(
            wordToGuess: ref.read(wordleWordsStateProvider.notifier).correctWord,
            word: words[index],
            isActive: index == 0 && words[0] == '' || (words[index] == '' && words[index - 1] != ''),
          ),
        ),
        separatorBuilder: (context, index) => AppDimensions.getVerticalSeparator(Dimension.small),
        itemCount: words.length,
      ),
    );
  }
}
