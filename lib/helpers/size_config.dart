import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;

  //screen info/config
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  static bool smallDevice;

  //text size config
  static double textSizeMainHeading;
  static double textSizeSubHeading;
  static double textSizeLarge;
  static double textSizeNormal;
  static double textSizeSmall;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    if (screenWidth > 350 && screenHeight > 600) {
      smallDevice = false;
    } else {
      smallDevice = true;
    }

    //setting text size based on screen size
    if (smallDevice) {
      textSizeMainHeading = 23;
      textSizeSubHeading = 18;
      textSizeLarge = 15;
      textSizeNormal = 12;
      textSizeSmall = 10;

    } else {
      textSizeMainHeading = 30;
      textSizeSubHeading = 21;
      textSizeLarge = 18;
      textSizeNormal = 16;
      textSizeSmall = 12;

    }

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}
