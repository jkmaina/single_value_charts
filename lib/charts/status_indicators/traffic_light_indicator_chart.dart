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
      valueStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      unitStyle: TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: labelStyle),
          const SizedBox(height: 8),
          // Custom traffic light representation
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTrafficLightCircle('red', status),
              const SizedBox(width: 4),
              _buildTrafficLightCircle('yellow', status),
              const SizedBox(width: 4),
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
        opacity = (currentStatus == 'red') ? 1.0 : 0.3;
        break;
      case 'yellow':
        color = Colors.yellow;
        opacity = (currentStatus == 'yellow') ? 1.0 : 0.3;
        break;
      case 'green':
        color = Colors.green;
        opacity = (currentStatus == 'green') ? 1.0 : 0.3;
        break;
      default:
        color = Colors.grey;
        opacity = 0.3;
    }

    return Container(
      width: 20,
      height: 20,
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
