import 'dart:math';

List<double> convertRotationToMatrix(double rotation) {
  final rad = rotation * pi / 180;
  return [cos(rad), -sin(rad), sin(rad), cos(rad)];
}
