import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pharmalink/resources/resources.dart';

void main() {
  test('animations assets test', () {
    expect(File(Animations.hourglass).existsSync(), isTrue);
    expect(File(Animations.noConnection).existsSync(), isTrue);
    expect(File(Animations.success).existsSync(), isTrue);
  });
}
