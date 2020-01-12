import 'dart:async';
import 'dart:math';

import 'package:analog_clock/circle_container.dart';
import 'package:analog_clock/clock_dial_painter.dart';
import 'package:analog_clock/rotating_hand.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';

class MirrorClock extends StatefulWidget {
  final ClockModel model;

  const MirrorClock(this.model);
  @override
  _MyClockState createState() => _MyClockState();
}

class _MyClockState extends State<MirrorClock> {
  var _now = DateTime.now();
  Timer _timer;
  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _now = DateTime.now();
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _now.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final time = DateFormat.Hms().format(DateTime.now());
    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: 'Analog clock with time $time',
        value: time,
      ),
      child: Center(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: CircleContainer(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                //second hand
                RotatingHand(angle: -_now.second * 6 * pi / 180),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleContainer(
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        //minute hand
                        RotatingHand(
                          angle: (-_now.minute * 6 - (_now.second / 60) * 6) *
                              pi /
                              180,
                          strokeWidth: 7.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CircleContainer(
                            padding: EdgeInsets.all(10),
                            child: CustomPaint(
                              painter: ClockDialPainter(),
                              child: Stack(
                                fit: StackFit.expand,
                                children: <Widget>[
                                  //hour hand
                                  RotatingHand(
                                    angle: (-_now.hour * 30 -
                                            (_now.minute / 60) * 30) *
                                        pi /
                                        180,
                                    strokeWidth: 10.0,
                                    lengthreduceby: 60.0,
                                  ),
                                  Center(
                                    child: Container(
                                      width: 5,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
