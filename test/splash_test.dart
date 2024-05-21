import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pharmalink/resources/resources.dart';

void main() {
  test('splash assets test', () {
    expect(File(Splash.splashAndroid12).existsSync(), isTrue);
    expect(File(Splash.splashInvertAndroid12).existsSync(), isTrue);
    expect(File(Splash.splashInvert).existsSync(), isTrue);
    expect(File(Splash.splash).existsSync(), isTrue);
  });
}
