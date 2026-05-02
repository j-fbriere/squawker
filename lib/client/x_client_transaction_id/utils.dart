// JavaScript-style Math.round: rounds half away from zero (like JS, unlike Dart's default
// banker's rounding). Used to mirror the Python Math.round() in transaction.py.
int jsRound(double num) {
  final x = num.floor();
  if (num - x >= 0.5) return num.ceil();
  return x;
}

// Round to 2 decimal places, mirroring Python's round(value, 2).
double roundTo2(double value) {
  return (value * 100).round() / 100.0;
}

// Returns -1.0 if num is odd, 0.0 if even. Mirrors Python's is_odd().
double isOdd(int num) => num % 2 != 0 ? -1.0 : 0.0;

// Converts a non-negative float to its hexadecimal string representation,
// preserving the fractional part (e.g. 2.75 → "2.C"). Mirrors Python's float_to_hex().
String floatToHex(double x) {
  final result = <String>[];
  final fraction = x - x.toInt();
  int quotient = x.toInt();
  double current = x;

  while (quotient > 0) {
    quotient = (current / 16).toInt();
    final remainder = (current - quotient * 16).toInt();
    result.insert(0, remainder > 9 ? String.fromCharCode(remainder + 55) : '$remainder');
    current = quotient.toDouble();
  }

  if (fraction == 0.0) return result.join();

  result.add('.');
  double frac = fraction;
  while (frac > 0) {
    frac *= 16;
    final integer = frac.toInt();
    frac -= integer;
    result.add(integer > 9 ? String.fromCharCode(integer + 55) : '$integer');
  }

  return result.join();
}
