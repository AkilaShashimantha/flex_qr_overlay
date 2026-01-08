library flex_qr_overlay;

import 'package:flutter/material.dart';

// 1. Export the config so the test app can see it
export 'src/domain/entities/overlay_config.dart'; 

// 2. Export your widget
export 'src/presentation/qr_painter.dart';

import 'src/domain/entities/overlay_config.dart';
import 'src/presentation/qr_painter.dart';

class QrScannerOverlay extends StatefulWidget {
  final OverlayConfig? config;

  const QrScannerOverlay({super.key, this.config});

  @override
  State<QrScannerOverlay> createState() => _QrScannerOverlayState();
}

class _QrScannerOverlayState extends State<QrScannerOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // 1. Initialize controller for 2-second loops
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); // This makes the line go up AND down
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size.infinite,
          painter: QrOverlayPainter(
            widget.config ?? OverlayConfig(),
            _controller.value, // Pass the 0.0 -> 1.0 value
          ),
        );
      },
    );
  }
}
