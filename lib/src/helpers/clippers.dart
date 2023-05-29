import 'package:flutter/material.dart';

class OvalBottomBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width - size.width / 4, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}


class LinearBottomBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / size.width;
    final double _yScaling = size.height / 700;
    path.lineTo(0 * _xScaling, 0 * _yScaling);
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      700 * _xScaling,
      0 * _yScaling,
      700 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      700 * _xScaling,
      0 * _yScaling,
      700 * _xScaling,
      400 * _yScaling,
      700 * _xScaling,
      400 * _yScaling,
    );
    path.cubicTo(
      700 * _xScaling,
      400 * _yScaling,
      0 * _xScaling,
      700 * _yScaling,
      0 * _xScaling,
      700 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      700 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
