import 'package:bcgdvtest/src/util/string_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('String util test', () {
    test('should replace whitespace with +', () {
      const exampleWord = 'test keyword';
      final resultWord = StringUtil.replaceWhitespaceWithPlus(exampleWord);
      expect(resultWord, equals('test+keyword'));
    });

    test('should shorten to chars... when characters more than 14', () {
      const exampleWord = 'characters more than 14';
      final result = StringUtil.shortenString(exampleWord);
      expect(result, equals('characters mor...'));
    });
  });
}
