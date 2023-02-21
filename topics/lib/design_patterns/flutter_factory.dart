import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class PlatfromButton {
  Widget build(VoidCallback onPressed, Widget child);

  factory PlatfromButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidButton();
      case TargetPlatform.iOS:
        return IOSButton();
      default:
        return AndroidButton();
    }
  }
}

class AndroidButton implements PlatfromButton {
  @override
  Widget build(VoidCallback onPressed, Widget child) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}

class IOSButton implements PlatfromButton {
  @override
  Widget build(VoidCallback onPressed, Widget child) {
    return CupertinoButton(child: child, onPressed: onPressed);
  }
}
