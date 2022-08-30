import 'package:lttb/lttb.dart';

void main() {
  var demoData = [
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
  List<List<num>> downSampledData = lttb(demoData, 400);
  print('downsampled data: ${downSampledData.toString()}');
}
