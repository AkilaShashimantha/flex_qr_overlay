import 'package:flutter/material.dart';
/// A configuration class that defines the visual style of the QR scanner overlay.
///
/// Use this to customize the border color, thickness, and the size of the 
/// transparent scanning area.
class OverlayConfig {
  /// The color of the focus frame borders. Defaults to [Colors.blue].
  final Color borderColor;
  /// The thickness of the focus frame borders. Defaults to 4.0.
  final double borderWidth;
  /// The corner radius of the scanning rectangle. Defaults to 12.0.
  final double borderRadius;
  /// The color of the semi-transparent area outside the focus frame.
  /// Defaults to a 50% black opacity.
  final Color overlayColor;
  /// The width and height of the square scanning area. Defaults to 250.0.
  final double scanAreaSize;

/// Creates a new [OverlayConfig] instance.
  OverlayConfig({
    this.borderColor = Colors.blue,
    this.borderWidth = 4.0,
    this.borderRadius = 12.0,
    this.overlayColor = const Color.fromRGBO(0, 0, 0, 0.5),
    this.scanAreaSize = 250.0,
  });
}
