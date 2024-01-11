// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';

class EconomicIndicatorChart extends SingleValueChart {
  final double indicatorValue;
  final double maxValue;
    @override
  final ChartThemeData? themeData;

  EconomicIndicatorChart({
    required String label,
    required this.indicatorValue,
    String unit = '',
    this.maxValue =
        100, // Default max value, can be adjusted as per the economic indicator's range
    this.themeData,
  }) : super(label: label, value: indicatorValue, unit: unit);

  @override
  Widget buildChart() {
    // Define default theme data
    const defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
      unitStyle: TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle valueStyle = themeData?.valueStyle ?? defaultThemeData.valueStyle;

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: defaultThemeData.labelStyle),
          const SizedBox(height: 8),
          SizedBox(
            width: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: indicatorValue / maxValue,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text('${indicatorValue.toStringAsFixed(1)} / $maxValue',
              style: valueStyle),
          const SizedBox(height: 4),
          Text(unit, style: defaultThemeData.unitStyle)
        ],
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
