import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pharmalink/resources/resources.dart';

void main() {
  test('logo assets test', () {
    expect(File(Logo.icon).existsSync(), isTrue);
    expect(File(Logo.logo).existsSync(), isTrue);
    expect(File(Logo.whiteLogo).existsSync(), isTrue);
  });
}
