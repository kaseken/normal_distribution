A minimal Dart module for working with normal distributions.

## Usage

### Cumulative distribution function (CDF)

Returns the cumulative distribution function for the given `mean` and `sigma`, evaluated at `x`.

```dart
NormalDistribution(mean: -0.21, sigma: 1.7).cdf(x: -0.73);
// Result: 0.3798471227404693
```

#### Note:

- Returns null if `sigma` is zero or negative.

### Probability density function (PDF)

Returns the probability density function for the given `mean` and `sigma`, evaluated at `x`.

```dart
NormalDistribution(mean: -0.21, sigma: 1.7).pdf(x: -0.73);
// Result: 0.22394634407779582
```

#### Note:

- Returns null if `sigma` is zero or negative.
