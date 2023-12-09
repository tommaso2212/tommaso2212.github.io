import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final wordleWordsStateProvider = StateNotifierProvider<WordleWordsStateNotifier, List<String>>((ref) {
  return WordleWordsStateNotifier();
});

class WordleWordsStateNotifier extends StateNotifier<List<String>> {
  late String correctWord;
  bool isInGame = true;

  WordleWordsStateNotifier() : super(List.filled(6, '')) {
    setCorrectWord();
  }

  Future<bool> addWord(String word) async {
    var validation = await _validateWord(word);
    if (validation) {
      var index = state.indexWhere((element) => element == '');
      state[index] = word;
      state = List.of(state);
      setInGame();
    }
    return validation;
  }

  Future<bool> _validateWord(String word) async {
    return _WordleWords.wordsIt.contains(word);
  }

  Future<void> setCorrectWord() async {
    var random = Random();
    var index = random.nextInt(_WordleWords.wordsIt.length);
    correctWord = _WordleWords.wordsIt[index];
  }

  void setInGame() {
    isInGame = !state.contains(correctWord) && state.contains('');
  }
}

class _WordleWords {
  static const List<String> wordsIt = [
    'abito',
    'acqua',
    'aiuto',
    'altro',
    'amare',
    'amico',
    'amore',
    'ampio',
    'anche',
    'anima',
    'animo',
    'assai',
    'avere',
    'bagno',
    'basso',
    'bello',
    'bocca',
    'bosco',
    'bravo',
    'breve',
    'buono',
    'caffè',
    'caldo',
    'campo',
    'carne',
    'carta',
    'causa',
    'certo',
    'cielo',
    'circa',
    'città',
    'collo',
    'colpa',
    'colpo',
    'conto',
    'corpo',
    'corsa',
    'corso',
    'costa',
    'crisi',
    'croce',
    'cuore',
    'dente',
    'dolce',
    'donna',
    'entro',
    'epoca',
    'esame',
    'fatto',
    'fermo',
    'ferro',
    'festa',
    'fiore',
    'fiume',
    'folla',
    'fondo',
    'forma',
    'forse',
    'forte',
    'forza',
    'frase',
    'fuoco',
    'fuori',
    'gamba',
    'gatto',
    'gente',
    'gesto',
    'gioco',
    'gioia',
    'grado',
    'grave',
    'greco',
    'gusto',
    'isola',
    'largo',
    'latte',
    'legge',
    'letto',
    'libro',
    'linea',
    'lotta',
    'lungo',
    'luogo',
    'madre',
    'mamma',
    'massa',
    'medio',
    'mente',
    'messa',
    'metro',
    'mezzo',
    'molto',
    'mondo',
    'monte',
    'morte',
    'notte',
    'nulla',
    'nuovo',
    'odore',
    'oltre',
    'ombra',
    'onore',
    'opera',
    'padre',
    'paese',
    'parte',
    'passo',
    'paura',
    'pazzo',
    'pelle',
    'pezzo',
    'piano',
    'piede',
    'pieno',
    'pietà',
    'poeta',
    'ponte',
    'porre',
    'porta',
    'porto',
    'posto',
    'prato',
    'prima',
    'primo',
    'prova',
    'punta',
    'punto',
    'quale',
    'quasi',
    'reale',
    'regno',
    'resto',
    'ricco',
    'rosso',
    'russo',
    'sacro',
    'scala',
    'scena',
    'scopo',
    'segno',
    'senso',
    'senza',
    'serie',
    'serio',
    'sogno',
    'sonno',
    'sopra',
    'sotto',
    'spesa',
    'stare',
    'stato',
    'tanto',
    'tardi',
    'tempo',
    'terzo',
    'testa',
    'treno',
    'tutto',
    'udire',
    'umano',
    'unico',
    'unire',
    'usare',
    'utile',
    'valle',
    'vario',
    'vasto',
    'vento',
    'verde',
    'verso',
    'villa',
    'vista',
    'volta',
    'volto',
    'vuoto',
    'zitto'
  ];
}
