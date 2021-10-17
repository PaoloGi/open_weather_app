import 'package:flutter/material.dart';
import 'package:weather_excercise/core/models/wizard_page_content_model.dart';
import 'package:weather_excercise/ui/theme/theme_settings.dart';
import 'package:weather_excercise/ui/theme/weather_app_colors.dart';

class WizardPage extends StatelessWidget {

  final WizardPageContentModel page;
  const WizardPage({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;
    bool isWideScreen = _screenHeight <  _screenWidth;
    String assetUrlImage = isWideScreen ? this.page.imageUrlWide : this.page.imageUrl;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(16),
            height: isWideScreen && !ThemeSettings.isALargeScreen(context) ? _screenHeight * 0.55  :_screenHeight * 0.6,
            child:
            Image.asset( assetUrlImage, fit: BoxFit.fitWidth, alignment:  Alignment.bottomCenter)
        ),
        Expanded(
          child: Container(
            width: _screenWidth * 0.83,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //TITOLO
                Container(
                  child:
                  Text(
                    page.titolo,
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(
                      fontSize: FIELDS_TEXT_SIZE,
                      color: WeatherAppColors.appColor,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
                //SOTTOTITOLO
                Container(
                  width: _screenWidth / 1.2,
                  child:
                  Text(
                      page.sottotitolo,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: FIELDS_TEXT_SIZE*0.65, color: WeatherAppColors.appColor)),
                ),

              ],
            ),

          ),
        ),



      ],
    );
  }
}



