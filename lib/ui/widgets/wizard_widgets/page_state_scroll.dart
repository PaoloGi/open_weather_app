import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_excercise/ui/theme/weather_app_colors.dart';
import 'package:weather_excercise/ui/widgets/wizard_widgets/page_indicator.dart';

class PageStateScroll extends StatelessWidget {
  final int selectedPage;
  final int numberOfPages;
  final Function()? onBackPressed;
  final Function()? onForwardPressed;

  const PageStateScroll({
    Key? key,
    required this.selectedPage,
    required this.numberOfPages,
    required this.onBackPressed,
    required this.onForwardPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
          child:
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(right: 8),
                    child:
                    IconButton(
                        icon:
                        Icon(
                          CupertinoIcons.left_chevron,
                          size: 40,
                          color: selectedPage == 0 ? WeatherAppColors.appColor.shade50 : WeatherAppColors.appColor),
                        onPressed: this.onBackPressed
                      )
                ),
                Container(
                    margin: EdgeInsets.only(top: 12, left: 8),
                    child:
                    Row(
                        children:
                        List.generate(numberOfPages, (index) =>
                            PageIndicator(active: selectedPage == index)))
                ),
                Container(
                    margin: EdgeInsets.only(right: 8),
                    child:
                    IconButton(
                        icon: Icon(
                            CupertinoIcons.right_chevron,
                            size: 40,
                            color: selectedPage == (numberOfPages-1) ? WeatherAppColors.appColor.shade50 : WeatherAppColors.appColor),
                        onPressed: this.onForwardPressed
                    )
                ),
              ])
      );
  }
}

