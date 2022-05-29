import 'dart:math';

class NormalDistribution {
  final double mean;
  final double standardDeviation;

  const NormalDistribution({
    required this.mean,
    required this.standardDeviation,
  });

  double zScore({required double value}) => (value - mean) / standardDeviation;

  double pdf({required double value}) {
    final dividiend = pow(
      e,
      -(pow(value - mean, 2.0) / (2 * pow(standardDeviation, 2.0))),
    );
    final divisor = standardDeviation * sqrt(2 * pi);
    return dividiend / divisor;
  }
}
