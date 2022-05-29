import 'package:normal_distribution/normal_distribution.dart';
import 'package:test/test.dart';

void main() {
  group('cdf', () {
    test('when mean is 0 and sigma is 1', () {
      expect(
        NormalDistribution(mean: 0, sigma: 1).cdf(x: 0),
        0.5000000150000002,
      );
      expect(
        NormalDistribution(mean: 0, sigma: 1).cdf(x: -1),
        0.15865526139567465,
      );
      expect(
        NormalDistribution(mean: 0, sigma: 1).cdf(x: 1),
        0.8413447386043253,
      );
      expect(
        NormalDistribution(mean: 0, sigma: 1).cdf(x: 6),
        0.9999999990134124,
      );
    });

    test('when mean is not 0 and sigma is not 1', () {
      expect(
        NormalDistribution(mean: -2.31, sigma: 3.00001).cdf(x: 0.014401),
        0.7807704188058089,
      );
      expect(
        NormalDistribution(mean: -0.21, sigma: 1.7).cdf(x: -0.73),
        0.3798471227404693,
      );
    });

    test('when sigma is 0', () {
      expect(
        NormalDistribution(mean: -2.31, sigma: 0).cdf(x: 0.014401),
        null,
      );
    });

    test('when sigma is negative', () {
      expect(
        NormalDistribution(mean: -2.31, sigma: -0.01).cdf(x: 0.014401),
        null,
      );
    });
  });

  group('pdf', () {
    test('when mean is 0 and sigma is 1', () {
      expect(
        NormalDistribution(mean: 0, sigma: 1).pdf(x: 0),
        0.3989422804014327,
      );
      expect(
        NormalDistribution(mean: 0, sigma: 1).pdf(x: -1),
        0.24197072451914337,
      );
      expect(
        NormalDistribution(mean: 0, sigma: 1).pdf(x: 1),
        0.24197072451914337,
      );
    });

    test('when mean is not 0 and sigma is not 1', () {
      expect(
        NormalDistribution(mean: 12.4, sigma: 3.21).pdf(x: 13.92),
        0.11110048870538951,
      );
      expect(
        NormalDistribution(mean: 0.0000000014, sigma: 0.980000001)
            .pdf(x: 2e-12),
        0.4070839591779069,
      );
      expect(
        NormalDistribution(mean: -0.21, sigma: 1.7).pdf(x: -0.73),
        0.22394634407779582,
      );
    });

    test('when sigma is 0', () {
      expect(
        NormalDistribution(mean: 0.0000000014, sigma: 0).pdf(x: 2e-12),
        null,
      );
    });

    test('when sigma is negative', () {
      expect(
        NormalDistribution(mean: 0.0000000014, sigma: -0.01).pdf(x: 2e-12),
        null,
      );
    });
  });
}
