import 'package:flutter/material.dart';
import 'package:trackizer/common/common_extension.dart';
import 'package:vector_math/vector_math.dart';

class CustomArcPainter extends CustomPainter {
  final double start;
  final double end;
  final double width;
  final double blurwidth;

  CustomArcPainter(
      {this.start = 0, this.end = 270, this.width = 15, this.blurwidth = 6});
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);

    var gradientColor = LinearGradient(
        colors: [Tcolor.secondary, Tcolor.secondary],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);
    Paint activePaint = Paint()..shader = gradientColor.createShader(rect);
    activePaint.style = PaintingStyle.stroke;
    activePaint.strokeWidth = width;
    activePaint.strokeCap = StrokeCap.round;

    Paint backgroundPaint = Paint();
    backgroundPaint.color = Tcolor.grey60.withOpacity(0.5);
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = width;
    backgroundPaint.strokeCap = StrokeCap.round;

    Paint shadowPaint = Paint()
      ..color = Tcolor.secondary.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width + blurwidth
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    var startVal = 135.0 + start;

    canvas.drawArc(
        rect, radians(startVal), radians(270), false, backgroundPaint);

    // Draw shadow arc
    Path path = Path();
    path.addArc(rect, radians(startVal), radians(end));

    canvas.drawPath(path, shadowPaint);
    canvas.drawArc(rect, radians(startVal), radians(end), false, activePaint);
  }

  @override
  bool shouldRepaint(CustomArcPainter oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(CustomArcPainter oldDelegate) => false;
}
