import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:weather_excercise/ui/theme/theme_settings.dart';
import 'package:weather_excercise/ui/theme/weather_app_colors.dart';
import 'package:weather_excercise/ui/widgets/home_widgets/home_content.dart';
import 'package:weather_excercise/ui/widgets/menu/weather_menu.dart';
import 'package:weather_excercise/ui/widgets/menu/weather_menu_icon_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
  GlobalKey<SliderMenuContainerState> key =   new GlobalKey<SliderMenuContainerState>();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:
        SliderMenuContainer(
            appBarColor: WeatherAppColors.appColor,
            key: key,
            sliderMenuOpenSize: 200,
            drawerIconColor: Colors.white,
            hasAppBar: false,
            sliderMenu: WeatherMenu(),
            sliderMain:
            Stack(
              children: [
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: APPBAR_HEIGHT),
                  child: HomeContent()
                ),
                Container(
                  margin: EdgeInsets.only(top: APPBAR_HEIGHT/3),
                  child: WeatherMenuIconButton(keyMenu: key),
                )

              ],
            )),
      );
  }

}