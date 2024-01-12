// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class EnergyConsumptionChart extends SingleValueChart {
  final double consumption; // Energy consumption value
  final String period; // Period of consumption (e.g., 'Monthly', 'Yearly')
  @override
  final ChartThemeData? themeData;

  EnergyConsumptionChart({
    required String label,
    required this.consumption,
    required this.period,
    String unit = 'kWh', // Default unit for energy consumption
    this.themeData,
  }) : super(label: label, value: consumption, unit: unit);

  @override
  Widget buildChart() {
    // Define default theme data
    const defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
      unitStyle: TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;
    TextStyle valueStyle = themeData?.valueStyle ?? defaultThemeData.valueStyle;

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
              fit: BoxFit.contain,
              child: Text('$label ($period)', style: labelStyle)),
          const Spacer(),
          FittedBox(
              fit: BoxFit.contain,
              child: Text('$consumption$unit', style: valueStyle)),
          const Spacer(),
          FittedBox(
              fit: BoxFit.contain,
              child: Text(unit,
                  style: themeData?.unitStyle ?? defaultThemeData.unitStyle))
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
