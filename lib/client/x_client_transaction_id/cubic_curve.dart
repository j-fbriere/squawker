class Cubic {
  final List<double> curves;

  Cubic(this.curves);

  double getValue(double time) {
    double startGradient = 0.0;
    double endGradient = 0.0;
    double start = 0.0;
    double mid = 0.0;
    double end = 1.0;

    if (time <= 0.0) {
      if (curves[0] > 0.0) {
        startGradient = curves[1] / curves[0];
      } else if (curves[1] == 0.0 && curves[2] > 0.0) {
        startGradient = curves[3] / curves[2];
      }
      return startGradient * time;
    }

    if (time >= 1.0) {
      if (curves[2] < 1.0) {
        endGradient = (curves[3] - 1.0) / (curves[2] - 1.0);
      } else if (curves[2] == 1.0 && curves[0] < 1.0) {
        endGradient = (curves[1] - 1.0) / (curves[0] - 1.0);
      }
      return 1.0 + endGradient * (time - 1.0);
    }

    while (start < end) {
      mid = (start + end) / 2;
      final xEst = calculate(curves[0], curves[2], mid);
      if ((time - xEst).abs() < 0.00001) {
        return calculate(curves[1], curves[3], mid);
      }
      if (xEst < time) {
        start = mid;
      } else {
        end = mid;
      }
    }
    return calculate(curves[1], curves[3], mid);
  }

  static double calculate(double a, double b, double m) {
    return 3.0 * a * (1 - m) * (1 - m) * m +
        3.0 * b * (1 - m) * m * m +
        m * m * m;
  }
}
