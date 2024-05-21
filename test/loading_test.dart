import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pharmalink/resources/resources.dart';

void main() {
  test('loading assets test', () {
    expect(File(Loading.loadingBlack).existsSync(), isTrue);
    expect(File(Loading.loadingWhite).existsSync(), isTrue);
  });
}
