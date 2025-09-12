import 'package:flutter/material.dart';

// Updated custom painter with background fill and better visibility
class GridBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Fill with light background for subtle contrast
    final bgPaint = Paint()..color = Colors.grey[50]!;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    // Grid lines (thinner, lower opacity for subtlety)
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 0.8
      ..style = PaintingStyle.stroke;

    final double gridSize = 20.0;

    // Vertical lines
    for (double x = 0; x <= size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Horizontal lines
    for (double y = 0; y <= size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
