// Flutter Packages
import 'package:flutter/material.dart';
// Screens
import 'package:pharmalink/screens/welcome_screen.dart';
// Packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PharmaLink",
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: "Readex Pro",
          ),
        ),
      ),
      initialRoute: WelcomeScreen.url,
      routes: {
        WelcomeScreen.url: (context) => WelcomeScreen(),
      },
    );
  }
}
