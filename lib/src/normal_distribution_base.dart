import 'dart:math';

import 'package:normal_distribution/src/z_table.dart';

class NormalDistribution {
  final double mean;
  final double sigma;

  const NormalDistribution({
    required this.mean,
    required this.sigma,
  });

  double? _z({required double x}) {
    if (sigma <= 0) {
      return null;
    }
    return (x - mean) / sigma;
  }

  double? pdf({required double x}) {
    if (sigma <= 0) {
      return null;
    }
    final dividiend = pow(
      e,
      -(pow(x - mean, 2.0) / (2 * pow(sigma, 2.0))),
    );
    final divisor = sigma * sqrt(2 * pi);
    return dividiend / divisor;
  }

  double? cdf({required double x}) {
    final z = _z(x: x);
    if (z == null) {
      return null;
    }
    final roundedZ = round(z, decimalPlaces: 2);
    if (roundedZ == 0) {
      return 0.5;
    }
    if (roundedZ <= -3.5) {
      return 0;
    }
    if (roundedZ >= 3.5) {
      return 1;
    }
    final zRow = (z.abs() * 10).floor() / 10;
    final zCol = (z.abs() * 100).round() % 10;
    final absPercentile = zTable[zRow]?[zCol];
    if (absPercentile == null) {
      throw Exception('Invalid zTable');
    }
    return z < 0 ? 1 - absPercentile : absPercentile;
  }
}

double round(double value, {required int decimalPlaces}) {
  final factor = pow(10, decimalPlaces);
  return (value * factor).round() / factor;
}
