import 'package:flutter_test/flutter_test.dart';
import 'package:guess_the_text/utils/animation.utils.dart';
import 'package:guess_the_text/utils/randomizer.utils.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'animation.utils_test.mocks.dart';

// Annotation which generates the *.mocks.dart library and the Mock class.
@GenerateMocks([RandomizerUtils])
void main() {
  group('getAnimationPath', () {
    test('should return expected image path', () {
      // given
      final mockRandomizerUtils = MockRandomizerUtils();
      when(mockRandomizerUtils.nextInt(any)).thenReturn(5);
      final AnimationUtils animationUtils = AnimationUtils(mockRandomizerUtils);

      // when
      final result = animationUtils.getAnimationPath();

      // then
      expect(result, 'assets/animations/loading/87735-distance-learning.json');
    });
  });
}
