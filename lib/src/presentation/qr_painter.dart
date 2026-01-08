import 'package:flutter/material.dart';
import '../domain/entities/overlay_config.dart';

class QrOverlayPainter extends CustomPainter {
  final OverlayConfig config;
  final double scanLineOffset;

  QrOverlayPainter(this.config, this.scanLineOffset);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = config.overlayColor;

    // 1. Draw the full background
    final backgroundPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // 2. Create the "Hole" path
    final scanRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: config.scanAreaSize,
      height: config.scanAreaSize,
    );

    final holePath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(scanRect, Radius.circular(config.borderRadius)),
      );

    // 3. Subtract hole from background
    final finalPath = Path.combine(
      PathOperation.difference,
      backgroundPath,
      holePath,
    );
    canvas.drawPath(finalPath, paint);

    // 4. Draw the borders (The focus frame)
    final borderPaint = Paint()
      ..color = config.borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = config.borderWidth;

    canvas.drawRRect(
      RRect.fromRectAndRadius(scanRect, Radius.circular(config.borderRadius)),
      borderPaint,
    );
    // Draw the Moving Scan Line
    final linePaint = Paint()
      ..color = config.borderColor.withOpacity(0.8)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // Calculate vertical position based on animation offset
    double lineY = scanRect.top + (scanRect.height * scanLineOffset);

    // Draw a line with a slight glow effect
    canvas.drawLine(
      Offset(scanRect.left + 10, lineY),
      Offset(scanRect.right - 10, lineY),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(covariant QrOverlayPainter oldDelegate) {
    return oldDelegate.scanLineOffset != scanLineOffset;
  }
}
