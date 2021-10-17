
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:weather_excercise/ui/theme/theme_settings.dart';
import 'package:weather_excercise/ui/theme/weather_app_colors.dart';
import 'package:weather_excercise/utils/nominatim_utils.dart';

class WeatherLocationAutocomplete extends StatefulWidget {

  final TextEditingController controller;
  final void Function(String?)? onSaved;
  final Function(Place) onSuggestionSelected;
  final Function(String)? validator;
  final TextStyle? style;
  final bool enabled;

  const WeatherLocationAutocomplete({
    Key? key,
    required this.controller,
    this.onSaved,
    required this.onSuggestionSelected,
    this.validator,
    this.style ,
    this.enabled = true
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() =>WeatherLocationAutocompleteState();
}

class WeatherLocationAutocompleteState extends State<WeatherLocationAutocomplete> {


  bool isError = false;
  String error = "";


  @override
  Widget build(BuildContext context) {
    return
      Container(
          margin: EdgeInsets.all(FIELDS_PADDING),
          width: FIELDS_WIDTH,
        child:
        Stack(
            alignment: Alignment.bottomCenter,
            children: [
          Container(
            width: FIELDS_WIDTH,
            height: FIELDS_HEIGHT,
              padding: EdgeInsets.only(right: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(FIELDS_ROUND_CORNER)),
                  color: WeatherAppColors.appColor.shade50.withOpacity(0.2)
              ),
            child:
            TypeAheadFormField(
              enabled: widget.enabled,
              textFieldConfiguration: TextFieldConfiguration(
                enabled: widget.enabled,
                style: widget.style ?? TextStyle(color: WeatherAppColors.appColor),
                controller: widget.controller,
                textInputAction: TextInputAction.done,

                decoration: InputDecoration(
                    prefixIconConstraints: kIsWeb ? null : BoxConstraints(
                      minWidth: 35,
                      minHeight: 35,
                    ),
                    suffixIconConstraints: kIsWeb ? null : BoxConstraints(
                      minWidth: 35,
                      minHeight: 35,
                    ),
                    prefixIcon: Icon(Icons.location_on_outlined, size: 22) ,
                    errorStyle: TextStyle(height: 0.001, color: Colors.transparent, decorationThickness: 0, fontSize: 0.001 ),
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    hintText: "Select city",
                    border: InputBorder.none
                ),
              ),
              suggestionsCallback: (pattern) async {
                List<Place> res =   await Nominatim.searchByName(
                    query: pattern,
                    limit: 3,
                    addressDetails: true,
                    extraTags: false);

                return NominatimUtils.getOnlyOneCityAndCountryFromList(res);
              },
              suggestionsBoxVerticalOffset: 0,
              itemBuilder: (context, suggestion) {
                final place = (suggestion as Place);
                return
                  ListTile(
                    title: Text(NominatimUtils.getCityAndCountryToStringFromPlace(place)));
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSuggestionSelected: (suggestion) {
                final place = (suggestion as Place);
                if(place.address != null){
                  widget.controller.text = NominatimUtils.getCityAndCountryToStringFromPlace(place);
                }
                widget.onSuggestionSelected(suggestion);
              },
              onSaved: widget.onSaved,
            )
          ),


          ]));
  }

}