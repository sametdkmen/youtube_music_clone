import 'package:flutter/material.dart';

class ColorConstant {
  static ColorConstant? _instance;
  static ColorConstant get instance {
    _instance ??= ColorConstant._init();
    return _instance!;
  }

  ColorConstant._init();

  final Color appSplashColor = Colors.white60;
  final Color appShortCutButtonColor = Colors.white12;
}
