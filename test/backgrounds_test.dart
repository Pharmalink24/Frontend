import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pharmalink/resources/resources.dart';

void main() {
  test('backgrounds assets test', () {
    expect(File(Backgrounds.doctor).existsSync(), isTrue);
    expect(File(Backgrounds.doctorDark).existsSync(), isTrue);
    expect(File(Backgrounds.doctors).existsSync(), isTrue);
    expect(File(Backgrounds.doctorsDark).existsSync(), isTrue);
    expect(File(Backgrounds.injured).existsSync(), isTrue);
    expect(File(Backgrounds.internetConnection).existsSync(), isTrue);
    expect(File(Backgrounds.security).existsSync(), isTrue);
    expect(File(Backgrounds.security1).existsSync(), isTrue);
    expect(File(Backgrounds.security1Dark).existsSync(), isTrue);
    expect(File(Backgrounds.securityDark).existsSync(), isTrue);
    expect(File(Backgrounds.signBackground).existsSync(), isTrue);
  });
}
