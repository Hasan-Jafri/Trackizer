import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';
import 'package:vector_math/vector_math.dart';

class ArcValueModel {
  final Color color;
  final double value;

  ArcValueModel({required this.color, required this.value});
}

class CustomArc180Painter extends CustomPainter {
  final double start;
  final double end;
  final double width;
  final double blurwidth;
  final double bgWidth;
  final double space;
  final List<ArcValueModel> drwArc;

  CustomArc180Painter(
      {required this.drwArc,
      this.space = 5,
      this.start = 0,
      this.end = 180,
      this.width = 15,
      this.bgWidth = 10,
      this.blurwidth = 6});
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);

    Paint backgroundPaint = Paint();
    backgroundPaint.color = Tcolor.grey60.withOpacity(0.5);
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = bgWidth;
    backgroundPaint.strokeCap = StrokeCap.round;

    var startVal = 180.0 + start;
    var drawStart = startVal;
    canvas.drawArc(
        rect, radians(startVal), radians(180), false, backgroundPaint);

    for (var arcObject in drwArc) {
      Paint activePaint = Paint();
      activePaint.color = arcObject.color;
      activePaint.style = PaintingStyle.stroke;
      activePaint.strokeWidth = width;
      activePaint.strokeCap = StrokeCap.round;

      Paint shadowPaint = Paint()
        ..color = arcObject.color.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = width + blurwidth
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

      // Draw shadow arc
      Path path = Path();
      path.addArc(rect, radians(drawStart), radians(arcObject.value - space));

      canvas.drawPath(path, shadowPaint);
      canvas.drawArc(rect, radians(drawStart), radians(arcObject.value - space),
          false, activePaint);

      drawStart = drawStart + arcObject.value + space;
    }
  }

  @override
  bool shouldRepaint(CustomArc180Painter oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(CustomArc180Painter oldDelegate) => false;
}
