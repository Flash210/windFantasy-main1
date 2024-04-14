import 'package:flutter/material.dart';

class ParallelogramShape extends StatelessWidget {
  final double width;
  final double height;
  final Gradient gradient;
  final Widget child;

  const ParallelogramShape({super.key, 
    required this.width,
    required this.height,
    required this.gradient, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: ParallelogramPainter(gradient),
      child: child,
    );
  }
}

class ParallelogramPainter extends CustomPainter {
  final Gradient gradient;

  ParallelogramPainter(this.gradient);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader =
          gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    path.moveTo(size.width * 0.1, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.9, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
