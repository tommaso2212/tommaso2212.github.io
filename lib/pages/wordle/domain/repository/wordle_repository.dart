import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_website/pages/wordle/domain/repository/wordle_repository_impl.dart';

final wordleRepositoryProvider = Provider<WordleRepository>((ref) {
  return WordleRepositoryImpl();
});

abstract class WordleRepository {
  Future<void> fetchWordls();
  Future<String> getCorrectWord();
  Future<bool> validateWord(String word);
}
