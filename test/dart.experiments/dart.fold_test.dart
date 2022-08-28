import 'package:flutter_test/flutter_test.dart';

class WordStats {
  String word;
  int count;

  WordStats({required this.word, required this.count});
}

void main() {
  group('Dart fold() method', () {
    List<String> words = ['Hello', 'Up', 'Up', 'Up', 'World', 'World', 'Door', 'Down', 'Handle', 'Down', 'Up', 'Down'];

    test('should reduce with collector', () {
      // given

      // when
      final Map<String, int> collectedStats = words.fold({}, (acc, word) {
        acc[word] = (acc[word] != null) ? acc[word]! + 1 : 1;
        return acc;
      });

      // then
      // expecting smtg like: {Hello: 1, Up: 4, World: 2, Door: 1, Down: 3, Handle: 1}
      expect(collectedStats, isNotNull);
      expect(collectedStats.length, 6);
      expect(collectedStats['Hello'], 1);
      expect(collectedStats['Up'], 4);
    });

    test('should reduce with collector and transform to List', () {
      // given
      final Map<String, int> collectedStats = words.fold({}, (acc, word) {
        acc[word] = (acc[word] != null) ? acc[word]! + 1 : 1;
        return acc;
      });

      // when
      final List<WordStats> stats =
          collectedStats.entries.map((entry) => WordStats(word: entry.key, count: entry.value)).toList();

      // then
      expect(stats, isNotNull);
      expect(stats.length, 6);
    });
  });
}
