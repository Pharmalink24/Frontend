import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ParallaxContainer extends StatefulWidget {
  final Widget child;
  const ParallaxContainer({super.key, required this.child});

  @override
  State<ParallaxContainer> createState() => _ParallaxContainerState();
}

class _ParallaxContainerState extends State<ParallaxContainer> {
  double xAngle = 0;
  double prevXAngle = 0;
  double yAngle = 0;
  double prevYAngle = 0;
  double zAngle = 0;
  double prevZAngle = 0;

  final streamsub = <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    super.initState();

    // Listen to the accelerometer events
    streamsub.add(accelerometerEventStream().listen((event) {
      setState(() {
        prevXAngle = xAngle;
        xAngle = event.x;
        prevYAngle = yAngle;
        yAngle = double.parse(event.y.toString());
        prevZAngle = zAngle;
        zAngle = double.parse(event.z.toString());
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          left: xAngle * -3,
          right: xAngle * 3,
          top: zAngle * -3,
          bottom: zAngle * 3,
          duration: const Duration(milliseconds: 300),
          child: Center(
            child: TweenAnimationBuilder(
                tween: Tween(begin: prevXAngle, end: xAngle),
                duration: const Duration(milliseconds: 300),
                builder: (context, double xValue, _) {
                  return TweenAnimationBuilder(
                      tween: Tween(begin: prevZAngle, end: zAngle),
                      duration: const Duration(milliseconds: 300),
                      builder: (context, double zValue, _) {
                        return Transform(
                          transform: Matrix4.identity()
                            ..setEntry(2, 1, 0.001)
                            ..rotateX(-zValue / 30)
                            ..rotateY(xValue / 30),
                          child: widget.child,
                        );
                      });
                }),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (final sub in streamsub) {
      sub.cancel();
    }
  }
}
