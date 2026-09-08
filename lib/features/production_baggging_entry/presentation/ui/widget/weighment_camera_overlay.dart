import 'package:alufluoride/features/production_baggging_entry/presentation/ui/widget/weighment_capture_rois.dart';
import 'package:flutter/material.dart';


class WeighmentCameraOverlay extends StatelessWidget {
  const WeighmentCameraOverlay({
    super.key,
    this.showLabels = true,
  });

  final bool showLabels;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        painter: _RoiBracketPainter(
          rois: WeighmentCaptureRois.all,
          labels: showLabels ? WeighmentCaptureRois.labels : const [],
        ),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _RoiBracketPainter extends CustomPainter {
  _RoiBracketPainter({
    required this.rois,
    required this.labels,
  });

  final List<Rect> rois;
  final List<String> labels;

  @override
  void paint(Canvas canvas, Size size) {
    final dimPath = Path()..addRect(Offset.zero & size);
    final holePath = Path();

    for (final norm in rois) {
      final rect = Rect.fromLTWH(
        norm.left * size.width,
        norm.top * size.height,
        norm.width * size.width,
        norm.height * size.height,
      );
      holePath.addRect(rect);
    }

    final cutout = Path.combine(PathOperation.difference, dimPath, holePath);
    canvas.drawPath(
      cutout,
      Paint()..color = Colors.black.withValues(alpha: 0.40),
    );

    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    for (var i = 0; i < rois.length; i++) {
      final norm = rois[i];
      final rect = Rect.fromLTWH(
        norm.left * size.width,
        norm.top * size.height,
        norm.width * size.width,
        norm.height * size.height,
      );

      _drawCornerBrackets(canvas, rect, paint);

      if (i < labels.length) {
        final tp = TextPainter(
          text: TextSpan(
            text: labels[i],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              shadows: [Shadow(blurRadius: 4, color: Colors.black)],
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(canvas, Offset(rect.left, rect.top - tp.height - 4));
      }
    }
  }

  void _drawCornerBrackets(Canvas canvas, Rect rect, Paint paint) {
    const arm = 22.0;
    final l = rect.left;
    final t = rect.top;
    final r = rect.right;
    final b = rect.bottom;

    canvas.drawLine(Offset(l, t), Offset(l + arm, t), paint);
    canvas.drawLine(Offset(l, t), Offset(l, t + arm), paint);
    canvas.drawLine(Offset(r, t), Offset(r - arm, t), paint);
    canvas.drawLine(Offset(r, t), Offset(r, t + arm), paint);
    canvas.drawLine(Offset(l, b), Offset(l + arm, b), paint);
    canvas.drawLine(Offset(l, b), Offset(l, b - arm), paint);
    canvas.drawLine(Offset(r, b), Offset(r - arm, b), paint);
    canvas.drawLine(Offset(r, b), Offset(r, b - arm), paint);
  }

  @override
  bool shouldRepaint(covariant _RoiBracketPainter oldDelegate) =>
      oldDelegate.rois != rois || oldDelegate.labels != labels;
}
