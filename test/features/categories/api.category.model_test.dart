import 'package:flutter_test/flutter_test.dart';
import 'package:guess_the_text/services/text.service/api.category.model.dart';

import '../../mocks/categories.mocks.dart';

void main() {
  group('ApiCategory', () {
    test('should read/write JSON', () {
      // given
      const category = mockUSStatesCategory;

      // when
      final json = category.toJson();

      // then
      expect(json, isNotEmpty);
      expect(ApiCategory.fromJson(json), category, reason: 'model instances should be equal');
    });

    test('should implement toString', () {
      // when
      final string = mockUSStatesCategory.toString();

      // then
      expect(string, isNotEmpty);
      expect(string, contains(mockUSStatesCategory.langCode));
      expect(string, contains(mockUSStatesCategory.iconName));
      expect(string, contains(mockUSStatesCategory.uuid));
    });

    test('should implement hashCode', () {
      // when
      final hashCode = mockUSStatesCategory.hashCode;
      final hashCode2 = mockPlanetsCategory.hashCode;

      // then
      expect(hashCode, greaterThan(0));
      expect(hashCode2, greaterThan(0));
      expect(hashCode, isNot(hashCode2));
    });

    test('should implement copyWith', () {
      // given
      const newUUID = 'Chuck Norris UUID is a fist of fury';

      // when
      final newCaterogy = mockUSStatesCategory.copyWith(uuid: newUUID);

      // then
      expect(newCaterogy.hashCode, isNot(mockUSStatesCategory.hashCode));
      expect(newCaterogy.uuid, isNot(mockUSStatesCategory.uuid));
      expect(newCaterogy.uuid, newUUID);

      // when
      final twinCategory = mockUSStatesCategory.copyWith();

      // then
      expect(twinCategory.hashCode, mockUSStatesCategory.hashCode);
      expect(twinCategory, mockUSStatesCategory);
    });
  });
}
