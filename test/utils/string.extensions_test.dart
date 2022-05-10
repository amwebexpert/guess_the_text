// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:guess_the_text/utils/string.extensions.dart';

void main() {
  group('isBlank / isNotBlank', () {
    var inputsToExpected = {
      '': true,
      ' ': true,
      '    ': true,
      '  Chuck  ': false,
      'Norris': false,
    };
    inputsToExpected.forEach((input, expected) {
      test('should return $expected for input "$input"', () {
        expect(input.isBlank, expected);
        expect(input.isNotBlank, !expected);
      });
    });
  });
  group('removeDiacritics', () {
    var inputsToExpected = {
      '': '',
      ' ': ' ',
      '  Chuck Norris ': '  Chuck Norris ',
      'é': 'e',
      withDia: withoutDia,
    };
    inputsToExpected.forEach((input, expected) {
      test('should return "$expected" for input "$input"', () {
        expect(input.removeDiacritics(), expected);
      });
    });
  });
}
