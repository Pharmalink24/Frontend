import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pharmalink/resources/resources.dart';

void main() {
  test('placeholder assets test', () {
    expect(File(Placeholder.doctorPlaceholder).existsSync(), isTrue);
    expect(File(Placeholder.userPlaceholder).existsSync(), isTrue);
  });
}
