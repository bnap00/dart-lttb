import 'package:lttb/lttb.dart';
import 'package:test/test.dart';

void main() {
  group('test with basic data', () {
    List<List<double>> demoData = [
      [0, 100.0],
      [1, 101.0],
      [2, 102.0],
      [3, 103.0],
      [4, 104.0],
      [5, 105.0],
      [6, 106.0],
      [7, 107.0],
      [8, 108.0],
      [9, 109.0],
      [10, 110.0],
    ];
    final awesome = lttb(demoData, 4);

    setUp(() {
      // Additional setup goes here.
    });

    test('downsample test', () {
      expect(awesome, [
        [0, 100.0],
        [1, 101.0],
        [5, 105.0],
        [10, 110.0]
      ]);
    });
  });
}
