import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pharmalink/resources/resources.dart';

void main() {
  test('placeholders assets test', () {
    expect(File(Placeholders.doctorPlaceholder).existsSync(), isTrue);
    expect(File(Placeholders.femalePlaceholder).existsSync(), isTrue);
    expect(File(Placeholders.malePlaceholder).existsSync(), isTrue);
    expect(File(Placeholders.malePlaceholder1).existsSync(), isTrue);
    expect(File(Placeholders.userPlaceholder).existsSync(), isTrue);
  });
}
