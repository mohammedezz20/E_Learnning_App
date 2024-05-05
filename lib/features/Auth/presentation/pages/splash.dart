import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


import 'onBoarding.dart';

class CustomCircleProgressIndicator extends StatefulWidget {
  const CustomCircleProgressIndicator({Key? key}) : super(key: key);

  @override
  _CustomCircleProgressIndicatorState createState() =>
      _CustomCircleProgressIndicatorState();
}

class _CustomCircleProgressIndicatorState
    extends State<CustomCircleProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
    _startTimer(); // Start the timer for navigation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    Timer(const Duration(seconds: 5), () {
      // Navigate to Slider page after 5 seconds
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: onBoarding(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(60, 60),
          painter: CircleProgressPainter(_animation.value),
        );
      },
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  final double rotation;

  CircleProgressPainter(this.rotation);

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;

    // Draw background circle
    final Paint backgroundPaint = Paint()
      ..color = Colors.white!
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(radius, radius), radius, backgroundPaint);

    // Draw rotating circles
    final Paint circlePaint = Paint()..color = Colors.blue;
    final int numCircles = 6;
    final double maxCircleRadius = radius / 6;
    final double minCircleRadius = radius / 3;

    for (int i = 0; i < numCircles; i++) {
      final double circleRadius = minCircleRadius +
          (maxCircleRadius - minCircleRadius) *
              (1 - i / (numCircles - 1));

      final double angle = (2 * pi / numCircles) * i + rotation;
      final double circleX =
          radius + (radius - circleRadius) * cos(angle);
      final double circleY =
          radius + (radius - circleRadius) * sin(angle);

      canvas.drawCircle(
          Offset(circleX, circleY), circleRadius, circlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content of the screen
          Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Image.asset(
                "assets/logo2.PNG",
                width: 300, // Set the fixed width
                height: 300, // Set the fixed height
              ),
            ),
          ),

          // Custom circle progress indicator at the bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 140,
            child: Center(
              child: CustomCircleProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
