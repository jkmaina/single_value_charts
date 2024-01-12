// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class IncidentReportsChart extends SingleValueChart {
  final int incidentCount; // Total number of incidents to display
  @override
  final ChartThemeData? themeData;
  @override
  final String unit;
  IncidentReportsChart({
    required String label,
    required this.incidentCount,
    this.unit = 'Incidents',
    this.themeData,
  }) : super(label: label, value: incidentCount.toDouble(), unit: unit);

  @override
  Widget buildChart() {
    // Define default theme data
    const defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 36, fontWeight: FontWeight.bold, color: Colors.red),
      unitStyle: TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;
    TextStyle valueStyle = themeData?.valueStyle ?? defaultThemeData.valueStyle;

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Display the label at the top
          FittedBox(fit: BoxFit.contain, child: Text(label, style: labelStyle)),
          const Spacer(),
          // Display the number of incidents
          FittedBox(
              fit: BoxFit.contain,
              child: Text('$incidentCount', style: valueStyle)),
          const Spacer(),
          // Display the unit at the bottom
          FittedBox(fit: BoxFit.contain, child: Text(unit, style: labelStyle))
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
