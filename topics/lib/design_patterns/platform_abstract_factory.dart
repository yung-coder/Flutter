import 'package:flutter/material.dart';
import 'package:topics/design_patterns/abstract_factory.dart';
import 'package:topics/design_patterns/flutter_factory.dart';

abstract class AbstractFactory {
  Widget buildButton(BuildContext context, String text, VoidCallback onPressed);
  Widget buildIndicator(BuildContext context);
}

class AbstractFactoryimp implements AbstractFactory {
  static AbstractFactoryimp? _instance;
  AbstractFactoryimp._internal();

  static AbstractFactoryimp  get instance {
    _instance ??= AbstractFactoryimp._internal();
    return _instance!;
  }

  @override
  Widget buildButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return PlatfromButton(Theme.of(context).platform)
        .build(onPressed, Text(text));
  }

  @override
  Widget buildIndicator(BuildContext context) {
    return PlatformInicator(Theme.of(context).platform).build();
  }
}
