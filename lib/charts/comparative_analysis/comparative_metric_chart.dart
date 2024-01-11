// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class ComparativeMetricChart extends SingleValueChart {
  final num primaryValue;
  final num secondaryValue;
  final String primaryLabel;
  final String secondaryLabel;
  @override
  final ChartThemeData? themeData;
  final NumberFormat? numberFormat;

  ComparativeMetricChart({
    required String label,
    required this.primaryValue,
    required this.secondaryValue,
    bool enableToolTip = false,
    this.numberFormat,
    this.primaryLabel = '',
    this.secondaryLabel = '',
    
    String unit = '',
    this.themeData,
  }) : super(label: label, value: primaryValue, unit: unit, enableTooltip: enableToolTip);

  @override
  Widget buildChart() {
    // Apply number formatting
    String primaryFormatedValue = numberFormat?.format(primaryValue) ??
        NumberFormat.compact().format(primaryValue);
    String secondaryFormatedValue = numberFormat?.format(secondaryValue) ??
        NumberFormat.compact().format(secondaryValue);

    // Default theme data
    const defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
      unitStyle: TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;
    TextStyle valueStyle = themeData?.valueStyle ?? defaultThemeData.valueStyle;
    TextStyle unitStyle = themeData?.unitStyle ?? defaultThemeData.unitStyle;

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: labelStyle),
          const SizedBox(height: 4),
          Text('$primaryLabel: $primaryFormatedValue', style: valueStyle),
          Text('$secondaryLabel: $secondaryFormatedValue',
              style: valueStyle.copyWith(color: Colors.green)),
          const SizedBox(height: 2),
          Text(unit, style: unitStyle),
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
