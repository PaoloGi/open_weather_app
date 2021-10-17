

import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:weather_excercise/ui/theme/weather_app_colors.dart';

class GaugeTemperature extends StatelessWidget {

  final double value;

  const GaugeTemperature({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 320,
        width: 320,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              maximum: 50,
              showLabels: true,
              showLastLabel: false,
              showFirstLabel: false,
              maximumLabels: 2,
              showTicks: true,
              tickOffset: 10,
              startAngle: 270,
              endAngle: 270,
              radiusFactor: 0.8,
              axisLineStyle: AxisLineStyle(
                thickness: 0.1,
                color: WeatherAppColors.appColor.shade50,
                thicknessUnit: GaugeSizeUnit.factor,
                cornerStyle: CornerStyle.startCurve,
              ),
              majorTickStyle: MajorTickStyle(length: 3),
              minorTickStyle: MinorTickStyle(length: 3),
              minorTicksPerInterval: 0,
              labelsPosition: ElementsPosition.outside,
              labelFormat: "{value} C°",
              axisLabelStyle: GaugeTextStyle(color: WeatherAppColors.appColor.shade200, fontSize: 11),
              ticksPosition: ElementsPosition.outside,
              pointers: <GaugePointer>[
                RangePointer(
                    value: value,
                    width: 0.1,
                    sizeUnit: GaugeSizeUnit.factor,
                    enableAnimation: true,
                    animationDuration: 100,
                    animationType: AnimationType.linear,
                    cornerStyle: CornerStyle.startCurve,
                    gradient: const SweepGradient(
                        colors: <Color>[WeatherAppColors.appColor, Color(0xFFFA8072)],
                        stops: <double>[0.25, 0.75])),
                MarkerPointer(
                  value: value,
                  markerType: MarkerType.circle,
                  enableAnimation: true,
                  animationDuration: 100,
                  animationType: AnimationType.linear,
                  color: WeatherAppColors.appColor,
                )
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    positionFactor: 0,
                    widget: Text(value.toStringAsFixed(0) + ' C°', style: TextStyle(fontSize: 25, color: WeatherAppColors.appColor.shade300),))
              ]),
        ]));
  }
}
