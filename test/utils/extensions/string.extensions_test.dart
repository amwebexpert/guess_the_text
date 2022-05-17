import 'package:flutter_test/flutter_test.dart';
import 'package:guess_the_text/utils/extensions/string.extensions.dart';

void main() {
  group('blank attribute extensions', () {
    const Map<String?, bool> testCases = {
      null: true,
      '': true,
      ' ': true,
      '    ': true,
      '  Chuck  ': false,
      'Norris': false,
    };

    testCases.forEach((input, expected) {
      test('"$input".isBlank should return $expected', () {
        expect(input.isBlank, expected);
      });

      test('"$input".isNotBlank should return ${!expected}', () {
        expect(input.isNotBlank, !expected);
      });
    });
  });

  group('removeDiacritics', () {
    const Map<String, String> testCases = {
      '': '',
      ' ': ' ',
      '  Chuck Norris ': '  Chuck Norris ',
      'é': 'e',
      withDia: withoutDia,
    };

    testCases.forEach((input, expected) {
      test('should return "$expected" for input "$input"', () {
        expect(input.removeDiacritics(), expected);
      });
    });
  });
}
