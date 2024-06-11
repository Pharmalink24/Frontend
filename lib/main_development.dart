import 'package:flutter/material.dart';
import 'pharmalink_app.dart';
import 'init.dart';

const kReleaseMode = false;

void main() async {
  // initialize the app
  await init();

  // run the app
  runApp(const PharmalinkApp());
}
