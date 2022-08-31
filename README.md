This plugin is used for downsampleing the data before rendering the chart. The purpose is to try retain the
visual characteristics of the original line using considerably fewer data points.
The algorithm (called _Largest-Triangle-Three-Buckets_ or _LTTB_) used in this plugin is described in a
Master's thesis (see [skemman.is/handle/1946/15343](https://skemman.is/handle/1946/15343)) in Computer Science by Sveinn Steinarsson

This Plugin is re-write of [Original Repo](https://github.com/sveinn-steinarsson/flot-downsample)

## Features

- Reduce the size of data without loosing resolution.
- Keeps extreme ends of data intact

## Usage

```dart
List<List<num>> downSampledData = lttb(demoData, 400);
```

## Additional information

### Known limitations

- Does not support gaps (null values) in the data array.
- X-values must be in a strictly increasing order.
