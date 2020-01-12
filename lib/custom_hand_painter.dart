import 'package:flutter/material.dart';

class CustomHandPainter extends CustomPainter {
  final double strokeWidth;
  final double lengthreduceby;
  CustomHandPainter({this.strokeWidth = 5.0, this.lengthreduceby = 3.0});
  @override
  void paint(Canvas canvas, Size size) {
    final center = (Offset.zero & size).center;
    final p2 = Offset(size.width / 2, lengthreduceby);
    final linePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(center, p2, linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
