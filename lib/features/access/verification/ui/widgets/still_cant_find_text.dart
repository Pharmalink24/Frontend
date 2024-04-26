import 'package:flutter/material.dart';

class StillCantFindText extends StatelessWidget {
  const StillCantFindText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text("Still can't find the email? No problem."),
    );
  }
}
