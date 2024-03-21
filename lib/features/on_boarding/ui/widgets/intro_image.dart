import 'package:flutter/material.dart';

class IntroImage extends StatelessWidget {
  final String path;
  const IntroImage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.white,
          Colors.white.withOpacity(0.0),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: const [0.04, 0.7],
      )),
      child: Image.asset(
        path,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
