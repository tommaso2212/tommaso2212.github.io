import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/wordle/domain/repository/wordle_repository.dart';

final wordleCorrectWordNotifierProvider = Provider<WordleCorrectWordNotifier>((ref) {
  final repository = ref.read(wordleRepositoryProvider);
  return WordleCorrectWordNotifier(repository);
});

final wordleCorrectWordStateProvider = StateNotifierProvider<WordleCorrectWordNotifier, String?>((ref) {
  return ref.read(wordleCorrectWordNotifierProvider);
});

class WordleCorrectWordNotifier extends StateNotifier<String?> {
  WordleCorrectWordNotifier(this.repository) : super(null);

  final WordleRepository repository;

  Future<void> initCorrectWord() async {
    final correctWord = await repository.getCorrectWord();
    state = correctWord;
  }
}
