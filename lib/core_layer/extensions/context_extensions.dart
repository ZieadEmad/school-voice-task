import 'dart:io';

import 'package:flutter/material.dart';

/// Helpers on BuildContext that uses MediaQuery
extension ContextExtension on BuildContext{
  /// [MediaQuery].of(context).size.shortestSide
  double get shortestSide=>MediaQuery.sizeOf(this).shortestSide;
  /// [MediaQuery].of(context).size.shortestSide
  double get longestSide=>MediaQuery.sizeOf(this).longestSide;
  /// [MediaQuery].of(context).size.shortestSide < 600 == true?
  bool get isIphone=>MediaQuery.sizeOf(this).shortestSide<600;
  /// [MediaQuery].of(context).orientation == Orientation.portrait?
  bool get isPortrait => Platform.isMacOS?false:MediaQuery.orientationOf(this)==Orientation.portrait;
  Orientation get orientation => MediaQuery.orientationOf(this);
  /// [MediaQuery].of(context).size.width
  double get width => MediaQuery.sizeOf(this).width;
  /// [MediaQuery].of(context).size.height
  double get height => MediaQuery.sizeOf(this).height;
  double get notchPadding => MediaQuery.viewPaddingOf(this).top;

}
