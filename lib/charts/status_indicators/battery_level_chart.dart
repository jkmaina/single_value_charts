// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class BatteryLevelChart extends SingleValueChart {
  final double batteryLevel; // Battery level percentage
    @override
  final ChartThemeData? themeData;

  BatteryLevelChart({
    required String label,
    required this.batteryLevel,
    this.themeData,
  }) : super(label: label, value: batteryLevel, unit: '%');

  @override
  Widget buildChart() {
    // Define default theme data
    final defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: _getBatteryColor(batteryLevel)),
      unitStyle: const TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;
    TextStyle valueStyle = themeData?.valueStyle ?? defaultThemeData.valueStyle;

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: labelStyle),
          const SizedBox(height: 8),
          // Custom battery icon representation
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Icon(Icons.battery_full, size: 50, color: Colors.grey[300]),
              ClipRect(
                child: Align(
                  alignment: Alignment.centerLeft,
                  widthFactor: batteryLevel / 100,
                  child: Icon(Icons.battery_full,
                      size: 50, color: _getBatteryColor(batteryLevel)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text('${batteryLevel.toStringAsFixed(1)}%', style: valueStyle),
        ],
      ),
    );
    
  }

  Color _getBatteryColor(double level) {
    // Define color based on battery level
    if (level >= 75) {
      return Colors.green; // High battery level
    } else if (level >= 25) {
      return Colors.yellow; // Medium battery level
    } else {
      return Colors.red; // Low battery level
    }
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
