import 'package:flutter/cupertino.dart';

class MyCustomClipper extends CustomClipper<Path> {
  final int shapeIndex;

  MyCustomClipper({this.shapeIndex});

  @override
  Path getClip(Size size) {
    Offset startPoint;
    double radius;
    // TODO: implement getClip
    if (shapeIndex == 0) {
      radius = 80;
      startPoint = Offset(size.width, size.height - (2 * radius));
      Path path = Path()
        ..moveTo(startPoint.dx, startPoint.dy)
        ..lineTo(size.width, 0)
        ..lineTo(0, 0)
        ..lineTo(0, size.height)
        ..quadraticBezierTo(
            0, size.height - radius, radius, size.height - radius)
        ..lineTo(size.width - radius, size.height - radius)
        ..quadraticBezierTo(
            size.width, size.height - radius, startPoint.dx, startPoint.dy)
        ..close();

      return path;
    } else if (shapeIndex == 1) {
      radius = 80;
      startPoint = Offset(size.width, size.height - (2 * radius));
      Path path = Path()
        ..moveTo(startPoint.dx, startPoint.dy)
        ..lineTo(size.width, radius)
        ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
        ..lineTo(radius, 0)
        ..quadraticBezierTo(0, 0, 0, radius)
        ..lineTo(0, size.height)
        ..quadraticBezierTo(
            0, size.height - radius, radius, size.height - radius)
        ..lineTo(size.width - radius, size.height - radius)
        ..quadraticBezierTo(
            size.width, size.height - radius, startPoint.dx, startPoint.dy)
        ..close();

      return path;
    } else {
      Path path = Path()
        ..moveTo(size.width, 200)
        ..lineTo(0, size.height - 200)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width, 0)
        ..quadraticBezierTo(size.width, 100, size.width - 100, 100)
        ..lineTo(100, 100)
        ..quadraticBezierTo(0, 100, 0, 200)
        ..close();

      return path;
    }
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
