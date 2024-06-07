import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';

class ErrorCard extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorCard({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.error_outline,
            color: context.colorScheme.error,
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(message, style: const TextStyle(fontSize: 18)),
          ),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
