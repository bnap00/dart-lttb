List<List<num>> lttb(List<List<num>> data, int threshold) {
  int dataLength = data.length;
  if (threshold >= dataLength) {
    return data; // nothing to do here
  }
  List<List<num>> sampled = List.generate(threshold, (index) => []);
  int sampledIndex = 0;

  // Bucket size. Leave room for start and end data points
  double every = (dataLength - 2) / (threshold - 2);

  int a = 0; // initially a is the first point in the triangle
  List<num> maxAreaPoint = [];
  double maxArea;
  double area;
  double nextA = double.minPositive;

  sampled[sampledIndex++] = data[a]; // always add first point

  for (int i = 0; i < threshold - 2; i++) {
    // calculate point average for next bucket (containing c)
    double avgX = 0.0;
    double avgY = 0.0;
    int avgRangeStart = (i + 1 * every).floor() + 1;
    int avgRangeEnd = (i + 2 * every).floor() + 1;
    int avgRangeLength = avgRangeEnd - avgRangeStart;

    for (; avgRangeStart < avgRangeEnd; avgRangeStart++) {
      avgX += data[avgRangeStart][0] * 1;
      avgY += data[avgRangeStart][1] * 1;
    }
    avgX /= avgRangeLength;
    avgY /= avgRangeLength;

    // get the range for this bucket
    var rangeOffs = ((i + 0) * every).floor() + 1;
    var rangeTo = ((i + 1) * every).floor() + 1;

    // point a
    var paX = data[a][0] * 1;
    var paY = data[a][1] * 1;
    maxArea = area = -1.0;

    for (; rangeOffs < rangeTo; rangeOffs++) {
      // Calculate triangle area over three buckets
      area = ((paX - avgX) * (data[rangeOffs][1] - paY) -
                  (paX - data[rangeOffs][0]) * (avgY - paY))
              .abs() *
          0.5;
      if (area > maxArea) {
        maxArea = area;
        maxAreaPoint = data[rangeOffs];
        nextA = rangeOffs.toDouble(); // Next a is this b
      }
    }
    if (maxAreaPoint != null) {
      sampled[sampledIndex++] = maxAreaPoint;
    }
    // sampled[sampledIndex++] = maxAreaPoint; // Pick this point from the bucket
    a = nextA.floor(); // This a is the next a (chosen b)
  }
  sampled[sampledIndex++] = data[dataLength - 1]; // Always add last

  return sampled;
}
