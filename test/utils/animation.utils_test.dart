import 'package:flutter_test/flutter_test.dart';
import 'package:guess_the_text/utils/animation.utils.dart';
import 'package:guess_the_text/utils/randomizer.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'animation.utils_test.mocks.dart';

// Annotation which generates the *.mocks.dart library and the Mock class.
@GenerateMocks([Randomizer])
void main() {
  group('getAnimationPath', () {
    test('should return expected image path', () {
      // given
      final mockRandom = MockRandomizer();
      when(mockRandom.nextInt(any)).thenReturn(5);
      final AnimationUtils animationUtils = AnimationUtils(mockRandom);

      // when
      final result = animationUtils.getAnimationPath();

      // then
      expect(result, 'assets/animations/loading/87735-distance-learning.json');
    });
  });
}