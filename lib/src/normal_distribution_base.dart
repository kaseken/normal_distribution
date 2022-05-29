import 'dart:math';

class NormalDistribution {
  final double mean;
  final double standardDeviation;

  const NormalDistribution({
    required this.mean,
    required this.standardDeviation,
  });

  double zScore({required double value}) => (value - mean) / standardDeviation;

  double pdf({required double x}) {
    final dividiend = pow(
      e,
      -(pow(x - mean, 2.0) / (2 * pow(standardDeviation, 2.0))),
    );
    final divisor = standardDeviation * sqrt(2 * pi);
    return dividiend / divisor;
  }

  double cdf({required double x}) {
    throw UnimplementedError();
  }

  double probabilityBetween({required double x1, required double x2}) =>
      (cdf(x: x1) - cdf(x: x2)).abs();
}
