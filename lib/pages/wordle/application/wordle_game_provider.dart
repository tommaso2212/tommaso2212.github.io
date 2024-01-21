import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/wordle/application/wordle_correct_word_provider.dart';
import 'package:personal_website/pages/wordle/application/wordle_words_provider.dart';
import 'package:personal_website/pages/wordle/components/wordle_grid_action_bar.dart';
import 'package:personal_website/pages/wordle/domain/repository/wordle_repository.dart';

final wordleGameProvider = StateNotifierProvider<WordleGameStateNotifier, bool>((ref) {
  final wordsNotifier = ref.read(wordleWordsNotifierProvider);
  final correctWordNotifier = ref.read(wordleCorrectWordNotifierProvider);
  final hideCorrectWordStateProvider = ref.read(wordleHideWordProvider.notifier);
  final repository = ref.read(wordleRepositoryProvider);
  return WordleGameStateNotifier(
    wordsNotifier,
    correctWordNotifier,
    hideCorrectWordStateProvider,
    repository,
  );
});

class WordleGameStateNotifier extends StateNotifier<bool> {
  WordleGameStateNotifier(
    this.wordsNotifier,
    this.correctWordNotifier,
    this.hideCorrectWordStateProvider,
    this.repository,
  ) : super(false) {
    initGame();
  }

  final WordleWordsStateNotifier wordsNotifier;
  final WordleCorrectWordNotifier correctWordNotifier;
  final StateController<bool> hideCorrectWordStateProvider;
  final WordleRepository repository;

  void initGame() async {
    await repository.fetchWordls();
    await correctWordNotifier.initCorrectWord();
    wordsNotifier.clear();
    hideCorrectWordStateProvider.state = true;
    state = true;
  }

  void endGame() {
    state = false;
  }

  Future<void> addWord(String word) async {
    final added = await wordsNotifier.addWord(word);
    if (added && word == correctWordNotifier.state) {
      endGame();
    }
  }
}
