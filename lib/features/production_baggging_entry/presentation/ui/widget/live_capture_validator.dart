import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/foundation.dart' show compute;
import 'package:image/image.dart' as img;

class LiveCaptureValidationResult {
  const LiveCaptureValidationResult.accepted()
      : isAccepted = true,
        rejectReason = null;

  const LiveCaptureValidationResult.rejected(this.rejectReason)
      : isAccepted = false;

  final bool isAccepted;
  final String? rejectReason;
}

class LiveCaptureValidator {
  LiveCaptureValidator._();

  static const double _maxSpecularRatio = 0.18;
  static const double _maxMoireScore = 0.42;
  static const double _rejectWhenBothAbove = 0.12; 

  static Future<LiveCaptureValidationResult> validate(File file) {
    return compute(_validateBytes, file.path);
  }

  static LiveCaptureValidationResult _validateBytes(String path) {
    try {
      final bytes = File(path).readAsBytesSync();
      final decoded = img.decodeImage(bytes);
      if (decoded == null) {
        return const LiveCaptureValidationResult.rejected(
          'Could not read the captured image. Please try again.',
        );
      }


      final small = img.copyResize(
        decoded,
        width: 320,
        interpolation: img.Interpolation.average,
      );
      final gray = img.grayscale(small);

      final specular = _specularHighlightRatio(gray);
      final moire = _moireScore(gray);


      if (specular >= _maxSpecularRatio) {
        return const LiveCaptureValidationResult.rejected(
          'Strong screen reflection detected. Point the camera at the live '
          'weighing machine display (not a phone/desktop photo) and retry.',
        );
      }


      if (moire >= _maxMoireScore) {
        return const LiveCaptureValidationResult.rejected(
          'Screen interference pattern detected. Capture the live weighing '
          'machine display directly, not an image shown on another screen.',
        );
      }


      if (specular >= _rejectWhenBothAbove && moire >= 0.28) {
        return const LiveCaptureValidationResult.rejected(
          'This looks like a photo of another screen. Please capture the live '
          'weighing machine display with the torch on.',
        );
      }

      return const LiveCaptureValidationResult.accepted();
    } catch (_) {
      return const LiveCaptureValidationResult.accepted();
    }
  }


  static double _specularHighlightRatio(img.Image gray) {
    var hot = 0;
    final total = gray.width * gray.height;
    for (final p in gray) {
      if (p.r >= 245) hot++;
    }
    return hot / total;
  }


  static double _moireScore(img.Image gray) {
    final w = gray.width;
    final h = gray.height;
    if (w < 16 || h < 16) return 0;


    var gradSum = 0.0;
    var count = 0;
    for (var y = 0; y < h; y++) {
      for (var x = 1; x < w; x++) {
        final a = gray.getPixel(x - 1, y).r.toDouble();
        final b = gray.getPixel(x, y).r.toDouble();
        gradSum += (b - a).abs();
        count++;
      }
    }
    final meanGrad = gradSum / count;


    final colMeans = List<double>.filled(w, 0);
    for (var x = 0; x < w; x++) {
      var s = 0.0;
      for (var y = 0; y < h; y++) {
        s += gray.getPixel(x, y).r.toDouble();
      }
      colMeans[x] = s / h;
    }

    final mean = colMeans.reduce((a, b) => a + b) / w;
    var varSum = 0.0;
    for (final v in colMeans) {
      final d = v - mean;
      varSum += d * d;
    }
    final variance = varSum / w;
    if (variance < 1e-6) return 0;


    var peak = 0.0;
    for (var lag = 2; lag <= 8; lag++) {
      var num = 0.0;
      var den = 0.0;
      for (var i = 0; i < w - lag; i++) {
        final a = colMeans[i] - mean;
        final b = colMeans[i + lag] - mean;
        num += a * b;
        den += a * a;
      }
      if (den > 0) {
        peak = math.max(peak, (num / den).abs());
      }
    }


    final gradNorm = (meanGrad / 40.0).clamp(0.0, 1.0);
    return (0.45 * gradNorm + 0.55 * peak).clamp(0.0, 1.0);
  }
}
