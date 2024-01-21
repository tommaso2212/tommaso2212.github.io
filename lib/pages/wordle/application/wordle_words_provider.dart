import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/wordle/domain/repository/wordle_repository.dart';

final wordleWordsNotifierProvider = Provider<WordleWordsStateNotifier>((ref) {
  final repository = ref.read(wordleRepositoryProvider);
  return WordleWordsStateNotifier(repository);
});

final wordleWordsStateProvider = StateNotifierProvider<WordleWordsStateNotifier, List<String>>((ref) {
  return ref.read(wordleWordsNotifierProvider);
});

class WordleWordsStateNotifier extends StateNotifier<List<String>> {
  WordleWordsStateNotifier(this.repository) : super([]);

  final WordleRepository repository;

  Future<bool> addWord(String word) async {
    final isValid = await repository.validateWord(word);
    if (isValid) {
      state = [...state, word];
    }
    return isValid;
  }

  void clear() {
    state = [];
  }
}
