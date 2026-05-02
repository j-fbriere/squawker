List<double> interpolate(List<double> from, List<double> to, double f) {
  if (from.length != to.length) {
    throw ArgumentError('Mismatched interpolation arguments: $from vs $to');
  }
  return List.generate(from.length, (i) => from[i] * (1 - f) + to[i] * f);
}
