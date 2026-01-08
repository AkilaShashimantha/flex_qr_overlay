import 'package:flutter/material.dart';

class OverlayConfig {
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final Color overlayColor;
  final double scanAreaSize;

  OverlayConfig({
    this.borderColor = Colors.blue,
    this.borderWidth = 4.0,
    this.borderRadius = 12.0,
    this.overlayColor = const Color.fromRGBO(0, 0, 0, 0.5),
    this.scanAreaSize = 250.0,
  });
}
