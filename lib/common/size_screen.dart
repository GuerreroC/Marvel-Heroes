import 'package:flutter/material.dart';

class SizeScreen {
  SizeScreen._();

  static final SizeScreen _instance = SizeScreen._();
  static late double screenWidth;
  static late double screenHeight;
  static late double pixelRatio;
  static bool isSmallScreenDevice = false;

  factory SizeScreen() {
    return _instance;
  }

  static void init(MediaQueryData mediaQuery) {
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
    pixelRatio = mediaQuery.devicePixelRatio;
    if (screenHeight < 600 && pixelRatio <= 2.5) isSmallScreenDevice = true;
  }

  static double height(double height) {
    return (screenHeight / 100) * height;
  }

  static double width(double width) {
    return (screenWidth / 100) * width;
  }
}
