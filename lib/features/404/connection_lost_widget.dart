
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmalink/resources/resources.dart';

class ConnectionLost extends StatelessWidget {
  const ConnectionLost({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: [
              Lottie.asset(
                Animations.noConnection,
                width: 200,
                height: 200,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 10),
              const Text("Connection Lost",style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.w500
              ))
            ],
          ),
        )
      ],
    );
  }
}