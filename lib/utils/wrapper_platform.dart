import 'package:flutter/foundation.dart';
class WrapperPlatform {
  static bool isMobile = (defaultTargetPlatform == TargetPlatform.iOS) || (defaultTargetPlatform == TargetPlatform.android);
  static bool isAndroid = (defaultTargetPlatform == TargetPlatform.android);
  static bool isIOS = (defaultTargetPlatform == TargetPlatform.iOS);
}