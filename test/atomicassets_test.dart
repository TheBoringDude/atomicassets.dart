import 'package:atomicassets/atomicassets.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = AtomicAssets("https://wax.api.atomicassets.io");

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome, isTrue);
    });
  });
}
