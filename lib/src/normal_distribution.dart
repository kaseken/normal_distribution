import 'dart:math';

class NormalDistribution {
  final double mean;
  final double sigma;

  const NormalDistribution({
    required this.mean,
    required this.sigma,
  });

  double _erfc({required double x}) {
    final z = x.abs();
    final t = 1 / (1 + z / 2);
    final r = t *
        exp(
          -z * z +
              [
                -0.82215223,
                1.48851587,
                -1.13520398,
                0.27886807,
                -0.18628806,
                0.09678418,
                0.37409196,
                1.00002368,
                -1.26551223,
              ].fold<double>(0.17087277, (prev, value) => value + t * prev),
        );
    return x >= 0 ? r : 2 - r;
  }

  /// Returns the probability density function for the given [mean] and [sigma], evaluated at [x].
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

  /// Returns the cumulative distribution function for the given [mean] and [sigma], evaluated at [x].
  double? cdf({required double x}) {
    if (sigma <= 0) {
      return null;
    }
    return 0.5 * _erfc(x: -(x - mean) / (sigma * sqrt(2)));
  }
}
