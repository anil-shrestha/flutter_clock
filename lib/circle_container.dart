import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  const CircleContainer({Key key, this.child, this.padding}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.black12,
            blurRadius: 13,
            spreadRadius: 1,
          )
        ],
      ),
      child: child,
    );
  }
}
