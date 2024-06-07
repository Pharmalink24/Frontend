import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension Navigation on BuildContext {
  // Navigation
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

  // Media Query
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;
  double get longestSide => MediaQuery.of(this).size.longestSide;
  double get shortestSide => MediaQuery.of(this).size.shortestSide;
  Orientation get orientation => MediaQuery.of(this).orientation;
  EdgeInsets get padding => MediaQuery.of(this).padding;

  //  Displaying SnackBar
  void showSnackBar(String message) {
    if (!mounted) return;
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);

    }
    // Displaying AlertDialog
    void displayAlertDialog({
      required String title,
      required String content,
      VoidCallback? onPositivePressed,
      String positiveButtonText = 'OK',
      VoidCallback? onNegativePressed,
      String negativeButtonText = 'Cancel',
    }) {
      if (!mounted) return;
      showDialog(
        context: this,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                onPressed: onNegativePressed ??
                    () {
                      Navigator.of(this).pop();
                    },
                child: Text(negativeButtonText),
              ),
              TextButton(
                onPressed: onPositivePressed ??
                    () {
                      Navigator.of(this).pop();
                    },
                child: Text(positiveButtonText),
              ),
            ],
          );
        },
      );
    }
  

  // Build Your Widget Based on Orientation
  T orientationAction<T>({
    required T Function() onPortrait,
    required T Function() onLandscape,
  }) {
    if (MediaQuery.of(this).orientation == Orientation.landscape) {
      return onLandscape();
    }
    return onPortrait();
  }
}

extension WidgetExt on Widget {
  Expanded expanded({int flex = 1}) => Expanded(
        flex: flex,
        child: this,
      );

  Opacity setOpacity(double val) => Opacity(
        opacity: val,
        child: this,
      );

  Padding withPadding(EdgeInsets padding) => Padding(
        padding: padding,
        child: this,
      );

  SizedBox box({double? width, double? height}) =>
      SizedBox(width: width, height: height, child: this);

  Center center() => Center(
        child: this,
      );

  Widget onClick(Function() onClick) => InkWell(
        onTap: onClick,
        child: this,
      );

  RotatedBox rotate(int quarterTurns) => RotatedBox(
        quarterTurns: quarterTurns,
        child: this,
      );
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

  bool isToday() {
    final now = DateTime.now();
    return day == now.day && month == now.month && year == now.year;
  }

  bool isYesterday() {
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    return day == yesterday.day &&
        month == yesterday.month &&
        year == yesterday.year;
  }

  bool isTomorrow() {
    final now = DateTime.now();
    final tomorrow = DateTime(now.year, now.month, now.day + 1);
    return day == tomorrow.day &&
        month == tomorrow.month &&
        year == tomorrow.year;
  }

  // yyyy-mm-dd
  String get stringFormat => toIso8601String().substring(0, 10);
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

  Text get text => Text(this);

  // 8 Digit Characters, Contains Lowercase, Uppercase, & Number
  bool isValidPassword() {
    return RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$').hasMatch(this);
  }

  bool isValidEmail() {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(this);
  }

  bool isURL() {
    // Regular expression for a simple URL pattern
    RegExp urlRegExp = RegExp(
      r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$',
      caseSensitive: false,
      multiLine: false,
    );

    return urlRegExp.hasMatch(this);
  }

  String append(String other) => '$this$other';

  String get capitalizeFirstLetter =>
      isNotEmpty ? this[0].toUpperCase() + substring(1) : this;

  String get removeWhitespace => replaceAll(RegExp(r'\s+'), '');

// Format: yyyy-MM-dd HH:mm:ss
  DateTime toDateTime() {
    return DateTime.parse(this);
  }
}

extension IntExtension on num {
  String get toCurrency {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(this);
  }

  String get toCommaSeparated {
    return NumberFormat.decimalPattern().format(this);
  }

  SizedBox get heightBox => SizedBox(
        height: toDouble(),
      );

  SizedBox get widthBox => SizedBox(
        width: toDouble(),
      );

  EdgeInsets get allPadding => EdgeInsets.all(toDouble());

  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: toDouble());

  EdgeInsets get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: toDouble());

  EdgeInsets get leftPadding => EdgeInsets.only(left: toDouble());

  EdgeInsets get rightPadding => EdgeInsets.only(right: toDouble());

  EdgeInsets get topPadding => EdgeInsets.only(top: toDouble());

  EdgeInsets get bottomPadding => EdgeInsets.only(bottom: toDouble());

  Duration get microseconds => Duration(microseconds: toInt());

  Duration get milliseconds => Duration(milliseconds: toInt());

  Duration get seconds => Duration(seconds: toInt());

  Duration get minutes => Duration(minutes: toInt());

  Duration get hours => Duration(hours: toInt());

  Duration get days => Duration(days: toInt());
}

extension FileExt on File {
  Future<Uint8List?> toUint8List() async {
    try {
      List<int> bytes = await readAsBytes();
      Uint8List uint8List = Uint8List.fromList(bytes);
      return uint8List;
    } catch (e) {
      return null;
    }
  }

  bool isImageFile() {
    final String extension = path.split('.').last.toLowerCase();
    return ['jpg', 'jpeg', 'png', 'gif', 'bmp'].contains(extension);
  }

  bool isVideoFile() {
    final String extension = path.split('.').last.toLowerCase();
    return ['mp4', 'avi', 'mkv', 'mov', 'wmv', 'flv', 'webm'].contains(extension);
  }

  bool isAudioFile() {
    final String extension = path.split('.').last.toLowerCase();
    return ['mp3', 'wav', 'ogg', 'aac', 'flac', 'm4a', 'wma'].contains(extension);
  }
}

extension ScopeFunctionExt<T> on T {

  // Do Something on The Object and returns Something
  R map<R>(R Function(T) block) {
    return block(this);
  }

  // Do Something on The Object and returns The Object
  T apply(Function(T) block) {
    block(this);
    return this;
  }
}