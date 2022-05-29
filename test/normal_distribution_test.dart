import 'package:normal_distribution/src/normal_distribution_base.dart';
import 'package:test/test.dart';

void main() {
  group('cdf', () {
    test('when μ is 0 and σ is 1', () {
      expect(
        NormalDistribution(mean: 0, sigma: 1).cdf(x: 0),
        0.5,
      );
      expect(
        NormalDistribution(mean: 0, sigma: 1).cdf(x: -1),
        0.15869999999999995,
      );
      expect(
        NormalDistribution(mean: 0, sigma: 1).cdf(x: 1),
        0.8413,
      );
      expect(
        NormalDistribution(mean: 0, sigma: 1).cdf(x: 6),
        1.0,
      );
    });

    test('when μ is not 0 and σ is not 1', () {
      expect(
        NormalDistribution(mean: -2.31, sigma: 3.00001).cdf(x: 0.014401),
        0.7794,
      );
    });
  });
}
