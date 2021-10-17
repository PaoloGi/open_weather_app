import 'package:flutter/cupertino.dart';
import 'package:weather_excercise/utils/wrapper_platform.dart';


const double FIELDS_HEIGHT = 40;
const double FIELDS_WIDTH = 300;
const double AUTOCOMPLETE_WIDTH = FIELDS_WIDTH+15;
const double FORM_SECTION_MAX_WIDTH = 450;
const double DRAWER_WIDTH = 220;
const double FIELDS_ROUND_CORNER = FIELDS_HEIGHT / 2.8;
const double FIELDS_PADDING = FIELDS_ROUND_CORNER/2;
const double FIELDS_TEXT_SIZE = 21; //FIELDS_HEIGHT/2;
const double SUBSECTION_TEXT_SIZE = FIELDS_TEXT_SIZE*0.7;
const double CUSTOM_NAVIGATION_BAR_HEIGHT = 70;
const double LIST_ITEM_NOTIFICATION_WIDTH = 400;
const double STEPPER_HEIGHT = 35;
const double SQUARE_BTN_SIZE = 45;
const double APPBAR_HEIGHT = 75;

class ThemeSettings {

  static double getAppBarHeight(){
    return WrapperPlatform.isMobile ? 85 : 60;
  }

  static bool isALargeScreen(BuildContext context){
    return MediaQuery.of(context).size.width > 800;
  }

}