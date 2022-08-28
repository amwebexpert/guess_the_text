import 'package:flutter_test/flutter_test.dart';

class WordStats {
  String word;
  int count;

  WordStats({required this.word, required this.count});
}

void main() {
  group('Dart fold() method', () {
    test('should reduce with collector', () {
      // given
      const List<WordStats> stats = [];
      const Map<String, int> counts = {};
      List<String> words = [
        'Hello',
        'Up',
        'Up',
        'Up',
        'World',
        'World',
        'Door',
        'Down',
        'Handle',
        'Down',
        'Up',
        'Down'
      ];

      // when
      final Map<String, int> allStats = words.fold({}, (acc, word) {
        acc[word] = (acc[word] != null) ? acc[word]! + 1 : 1;
        return acc;
      });

      // then
      // expecting smtg like: {Hello: 1, Up: 4, World: 2, Door: 1, Down: 3, Handle: 1}
      expect(allStats, isNotNull);
      expect(allStats.length, 6);
      expect(allStats['Hello'], 1);
      expect(allStats['Up'], 4);
    });
  });
}
