import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()    
class Error404Screen extends StatelessWidget {
  const Error404Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Error 404 !"),
      ),
    );
  }
}
