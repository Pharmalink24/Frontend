import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pharmalink/resources/resources.dart';

void main() {
  test('introductions assets test', () {
    expect(File(Introductions.image1_).existsSync(), isTrue);
    expect(File(Introductions.image2_).existsSync(), isTrue);
    expect(File(Introductions.image3_).existsSync(), isTrue);
    expect(File(Introductions.image4_).existsSync(), isTrue);
  });
}
