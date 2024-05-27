import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pharmalink/resources/resources.dart';

void main() {
  test('faces assets test', () {
    expect(File(Faces.confusedFace).existsSync(), isTrue);
    expect(File(Faces.emptyBox).existsSync(), isTrue);
    expect(File(Faces.frustratedFace).existsSync(), isTrue);
  });
}
