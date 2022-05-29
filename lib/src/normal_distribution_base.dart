import 'dart:math';

import 'package:normal_distribution/src/z_table.dart';

class NormalDistribution {
  final double mean;
  final double sigma;

  const NormalDistribution({
    required this.mean,
    required this.sigma,
  });

  double zScore({required double x}) => (x - mean) / sigma;

  double pdf({required double x}) {
    final dividiend = pow(
      e,
      -(pow(x - mean, 2.0) / (2 * pow(sigma, 2.0))),
    );
    final divisor = sigma * sqrt(2 * pi);
    return dividiend / divisor;
  }

  double cdf({required double x}) {
    final zScore = round(this.zScore(x: x), decimalPlaces: 2);
    if (zScore == 0) {
      return 0.5;
    }
    if (zScore <= -3.5) {
      return 0;
    }
    if (zScore >= 3.5) {
      return 1;
    }
    final absZScore = zScore.abs();
    final zRow = (absZScore * 10).floor() / 10;
    final zCol = round(
      ((absZScore * 100).round() % 10) / 100,
      decimalPlaces: 2,
    );
    final zColIndex = indexOfZTable(zCol);
    final absPercentile = zTable[zRow]?[zColIndex];
    if (absPercentile == null) {
      throw Exception('Invalid zTable');
    }
    return zScore < 0 ? 1 - absPercentile : absPercentile;
  }

  double probabilityBetween({required double x1, required double x2}) =>
      (cdf(x: x1) - cdf(x: x2)).abs();
}

double round(double value, {required int decimalPlaces}) {
  final factor = pow(10, decimalPlaces);
  return (value * factor).round() / factor;
}
