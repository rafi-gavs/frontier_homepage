import 'package:flutter/material.dart';

class TestingDecorations extends StatelessWidget {
  final CustomClipper<Path>? clipper;
  final Color color;

  const TestingDecorations(
      {super.key, required this.clipper, required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: clipper,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                // bottomLeft: Radius.circular(70.0),
                bottomRight: Radius.circular(35.0)),
            color: color),
        height: 500,
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 1.3);
    path.quadraticBezierTo(
        size.width / 1.8, size.height, size.width, size.height / 1.3);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }}

  
  class Curve1Clipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.quadraticBezierTo( size.height,size.width, size.height, size.width,);
   
     path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
//wave clipper
class SeaWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    var firststart = Offset(size.width / 14, size.height/2);
    var firstend = Offset(size.width / 1.65, size.height - 35.0);
    path.quadraticBezierTo(
     firststart.dy,   firststart.dx,firstend.dy,firstend.dx,);
    // path.lineTo(size.width/2.25, size.height);
    var secondstart =
        Offset(size.width - (size.width / 6.29), size.height - 50.0);
    var secondend = Offset(size.width, size.height - 4);
    path.quadraticBezierTo(
        secondstart.dx, secondstart.dy, secondend.dx, secondend.dy);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
//diagonal clipper
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width+220, size.height+100, size.width+130, size.height-150);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}