import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  double dynamicHeight(double value) => MediaQuery.sizeOf(this).height * value;
  double dynamicWidth(double value) => MediaQuery.sizeOf(this).width * value;
}
