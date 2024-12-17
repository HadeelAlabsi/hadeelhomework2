import 'package:flutter/material.dart';
import 'hadeel_colors.dart';

class HadeelWaveCard extends StatelessWidget {
  final Widget child;
  final double? height;

  const HadeelWaveCard({
    Key? key,
    required this.child,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: HadeelColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: HadeelColors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipPath(
        clipper: HadeelWaveClipper(),
        child: Container(
          decoration: BoxDecoration(
            gradient: HadeelColors.orangeGradient,
          ),
          child: child,
        ),
      ),
    );
  }
}

class HadeelWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Top wave
    path.lineTo(0, size.height * 0.2);
    var firstControlPoint = Offset(size.width * 0.25, 0);
    var firstEndPoint = Offset(size.width * 0.5, size.height * 0.2);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    var secondControlPoint = Offset(size.width * 0.75, size.height * 0.4);
    var secondEndPoint = Offset(size.width, size.height * 0.2);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    // Bottom wave
    path.lineTo(size.width, size.height * 0.8);
    var thirdControlPoint = Offset(size.width * 0.75, size.height);
    var thirdEndPoint = Offset(size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(
      thirdControlPoint.dx,
      thirdControlPoint.dy,
      thirdEndPoint.dx,
      thirdEndPoint.dy,
    );

    var fourthControlPoint = Offset(size.width * 0.25, size.height * 0.6);
    var fourthEndPoint = Offset(0, size.height * 0.8);
    path.quadraticBezierTo(
      fourthControlPoint.dx,
      fourthControlPoint.dy,
      fourthEndPoint.dx,
      fourthEndPoint.dy,
    );

    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
