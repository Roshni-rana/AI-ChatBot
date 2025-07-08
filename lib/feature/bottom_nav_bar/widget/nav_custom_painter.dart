import 'package:flutter/material.dart';

class NavCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..style = PaintingStyle.fill
      // ..shadowColor = Colors.black12
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    final path = Path();
    path.moveTo(0, 20);
    path.quadraticBezierTo(0, 0, 20, 0);
    path.lineTo(size.width / 2 - 45, 0);
    path.quadraticBezierTo(size.width / 2 - 35, 0, size.width / 2 - 35, 10);
    path.arcToPoint(
      Offset(size.width / 2 + 35, 10),
      radius: const Radius.circular(35),
      clockwise: false,
    );
    path.quadraticBezierTo(size.width / 2 + 35, 0, size.width / 2 + 45, 0);
    path.lineTo(size.width - 20, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black12, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
