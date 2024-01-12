// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class TrafficLightIndicatorChart extends SingleValueChart {
  final String status; // The status to be displayed ('red', 'yellow', 'green')
  @override
  final ChartThemeData? themeData;

  TrafficLightIndicatorChart({
    required String label,
    required this.status,
    this.themeData,
  }) : super(label: label, value: status, unit: '');

  @override
  Widget buildChart() {
    // Define default theme data
    const defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(fit: BoxFit.contain, child: Text(label, style: labelStyle)),
          const SizedBox(height: 8), // Spacing between label and lights
          // Custom traffic light representation
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTrafficLightCircle('red', status),
              const SizedBox(height: 4), // Spacing between lights
              _buildTrafficLightCircle('yellow', status),
              const SizedBox(height: 4), // Spacing between lights
              _buildTrafficLightCircle('green', status),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrafficLightCircle(String colorName, String currentStatus) {
    Color color;
    double opacity;

    switch (colorName) {
      case 'red':
        color = Colors.red;
        opacity = (currentStatus == 'red') ? 1.0 : 0.2;
        break;
      case 'yellow':
        color = Colors.yellow;
        opacity = (currentStatus == 'yellow') ? 1.0 : 0.2;
        break;
      case 'green':
        color = Colors.green;
        opacity = (currentStatus == 'green') ? 1.0 : 0.2;
        break;
      default:
        color = Colors.grey;
        opacity = 0.3;
    }

    return Container(
      width: 20, // Diameter of the circle
      height: 20, // Diameter of the circle
      decoration: BoxDecoration(
        color: color.withOpacity(opacity),
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget buildTooltip(BuildContext context, Offset globalPosition) {
    if (!enableTooltip) return Container();

    String tooltipText = '$label: $value $unit';
    return ChartToolTip(
      message: tooltipText,
      top: globalPosition.dy,
      left: globalPosition.dx,
      tooltipSettings: tooltipSettings,
    );
  }
}
