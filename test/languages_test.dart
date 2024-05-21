import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pharmalink/resources/resources.dart';

void main() {
  test('languages assets test', () {
    expect(File(Languages.ar).existsSync(), isTrue);
    expect(File(Languages.en).existsSync(), isTrue);
  });
}
