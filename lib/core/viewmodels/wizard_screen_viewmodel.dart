

import 'package:flutter/material.dart';
import 'package:weather_excercise/core/models/wizard_page_content_model.dart';

class WizardScreenViewModel  extends ChangeNotifier {

  int page = 0;
  List<WizardPageContentModel> pages = [
    WizardPageContentModel(
      "Welcome to Wheater app",
      "Everything you need to know about weather is only one glance away",
      "assets/wizard/0_c.png",
      "assets/wizard/0_c.png"
    ),
    WizardPageContentModel(
        "Find quickly your city",
        "The weather the nearest city at your fingertip",
        "assets/wizard/1_c.png",
        "assets/wizard/1_w.png"),
  ];

  void setPage(double nPage) {
    page = nPage.round();
    notifyListeners();
  }
}

