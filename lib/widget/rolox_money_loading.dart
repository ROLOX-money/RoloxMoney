import 'dart:math';

import 'package:flutter/material.dart';
/*Chinnadurai Viswanathan*/

// ignore: must_be_immutable
class RoloxMoneyLoading extends StatefulWidget {
  RoloxMoneyLoading(
      {Key? key,
      this.radius = 20,
      this.gradientColors,
      this.strokeWidth = 5.0,
      this.backgroundColor = Colors.black45})
      : super(key: key);
  final double radius;
  final List<Color>? gradientColors;
  final double strokeWidth;
  Color backgroundColor;

  @override
  State<RoloxMoneyLoading> createState() => RoloxMoneyLoadingState();
}

class RoloxMoneyLoadingState extends State<RoloxMoneyLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        color: widget.backgroundColor,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              RotationTransition(
                turns: Tween<double>(begin: 0.0, end: 1.0)
                    .animate(_animationController),
                // child: CustomPaint(
                //   size: const Size.fromRadius(30),
                //   painter: GradientCircularProgressPainter(
                //     radius: 30,
                //     gradientColors: [
                //       Theme.of(context).progressIndicatorTheme.color!,
                //       Theme.of(context).progressIndicatorTheme.circularTrackColor!
                //     ],
                //     strokeWidth: widget.strokeWidth,
                //   ),
                // ),
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  GradientCircularProgressPainter({
    required this.radius,
    required this.gradientColors,
    required this.strokeWidth,
  });

  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    final double offset = strokeWidth / 2;
    final Rect rect = Offset(offset, offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    paint.shader = SweepGradient(colors: gradientColors).createShader(rect);
    canvas.drawArc(rect, 0.0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
