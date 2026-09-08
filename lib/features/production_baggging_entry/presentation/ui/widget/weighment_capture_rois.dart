import 'package:flutter/material.dart';

/// Normalized ROI rectangles (0–1) for **landscape** SpeedAC IQ layout.
/// Capture screen is locked to landscape so these map to the horizontal HMI.
class WeighmentCaptureRois {
  WeighmentCaptureRois._();

  /// Large weight readout — wide horizontal box (e.g. "1015.0 kg").
  static const Rect weight = Rect.fromLTWH(0.24, 0.10, 0.44, 0.18);

  /// Machine clock / zeroing icons — compact horizontal box at top-right.
  static const Rect clock = Rect.fromLTWH(0.82, 0.05, 0.14, 0.10);

  /// Left process metrics — horizontal card over units accepted / done.
  static const Rect leftStats = Rect.fromLTWH(0.05, 0.42, 0.30, 0.22);

  /// Right process metrics — horizontal card over timing values.
  static const Rect rightStats = Rect.fromLTWH(0.60, 0.38, 0.32, 0.26);

  static const List<Rect> all = [weight, clock, leftStats, rightStats];

  static const List<String> labels = [
    'Weight',
    'Clock',
    'Left stats',
    'Right stats',
  ];
}
