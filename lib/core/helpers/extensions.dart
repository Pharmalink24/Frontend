import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? argument}) {
    return Navigator.of(this).pushNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? argument}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? argument, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: argument);
  }

  void pop() => Navigator.of(this).pop();

  void popUntil(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }
}

extension StringTime on TimeOfDay {
  int hoursIn12hour() {
    return (hour + 11) % 12 + 1;
  }

  String hourIn12hour({bool padding = true}) {
    return padding
        ? hoursIn12hour().toString().padLeft(2, '0')
        : hoursIn12hour().toString();
  }

  String minutes({bool padding = true}) {
    return padding ? minute.toString().padLeft(2, '0') : minute.toString();
  }

  String getPeriod() {
    return hour >= 12 ? "pm" : "am";
  }
}

extension StringDate on DateTime {
  String format(String format) {
    return DateFormat(format).format(this);
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String crop(int length) {
    return this.length > length ? '${substring(0, length - 1)}..' : this;
  }

  // Replace string with path map values
  String replacePath(Map<String, dynamic> paths) {
    String url = this;
    paths.forEach((key, value) {
      url = url.replaceAll("{$key}", '$value');
    });
    return url;
  }
}
