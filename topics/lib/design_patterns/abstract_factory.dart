import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformInicator {
  Color color();
  Widget build();

  factory PlatformInicator(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidIndicator();
      case TargetPlatform.iOS:
        return IosIndicator();
      default:
        return AndroidIndicator();
    }
  }
}

class AndroidIndicator implements PlatformInicator {
  @override
  Widget build() {
    return CircularProgressIndicator(
      color: color(),
    );
  }

  @override
  Color color() {
    return Colors.blue;
  }
}

class IosIndicator implements PlatformInicator {
  @override
  Widget build() {
    return CupertinoActivityIndicator(
      color: color(),
    );
  }

  @override
  Color color() {
    return Colors.red;
  }
}
