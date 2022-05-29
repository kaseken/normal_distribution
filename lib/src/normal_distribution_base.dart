class NormalDistribution {
  final double mean;
  final double standardDeviation;

  const NormalDistribution({
    required this.mean,
    required this.standardDeviation,
  });

  double zScore({required double value}) => (value - mean) / standardDeviation;
}
