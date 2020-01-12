import 'dart:math';
import 'package:flutter/material.dart';

class ClockDialPainter extends CustomPainter {
  final TextPainter textPainter;
  final Paint markPaint;
  final hourMarkLength = 10.0;
  final minuteMarkLength = 5.0;

  final hourMarkWidth = 3.0;
  final minuteMarkWidth = 1.5;
  ClockDialPainter()
      : markPaint = Paint(),
        textPainter = TextPainter(
            textDirection: TextDirection.rtl, textAlign: TextAlign.center);
  @override
  void paint(Canvas canvas, Size size) {
    var tickMarkLength;
    final radius = size.width / 2;
    final angle = 2 * pi / 60;
    canvas.save();
    canvas.translate(radius, radius);
    for (int i = 60; i > 0; i--) {
      //make the length and stroke of the tick marker longer and thicker depending
      tickMarkLength = i % 5 == 0 ? hourMarkLength : minuteMarkLength;
      markPaint.strokeWidth = i % 5 == 0 ? hourMarkWidth : minuteMarkWidth;
      canvas.drawLine(new Offset(0.0, -radius),
          new Offset(0.0, -radius + tickMarkLength), markPaint);

      if (i % 5 == 0) {
        canvas.save();
        canvas.translate(0, -radius + 20);
        //flip canvas
        canvas.scale(-1, 1);
        textPainter.text = TextSpan(
            text: "${i ~/ 5}",
            style: TextStyle(color: Colors.black, fontSize: 15));
        canvas.rotate(-angle * i);
        textPainter.layout();
        textPainter.paint(canvas,
            new Offset(-(textPainter.width / 2), -(textPainter.height / 2)));
        canvas.restore();
      }
      canvas.rotate(angle);
      //canvas.save();
      // canvas.restore();
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
