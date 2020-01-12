import 'package:analog_clock/custom_hand_painter.dart';
import 'package:flutter/material.dart';

class RotatingHand extends StatelessWidget {
  final double angle;
  final double strokeWidth;
  final double lengthreduceby;
  const RotatingHand(
      {this.angle, this.strokeWidth = 5.0, this.lengthreduceby = 3.0});
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        origin: Offset(0, 0),
        angle: angle,
        child: CustomPaint(
          painter: CustomHandPainter(
              strokeWidth: strokeWidth, lengthreduceby: lengthreduceby),
        ));
  }
}
