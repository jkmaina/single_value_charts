// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class QuantitativeComparisonChart extends SingleValueChart {
  final num primaryValue;
  final num secondaryValue;
  final String primaryLabel;
  final String secondaryLabel;
  @override
  final ChartThemeData? themeData;
  final NumberFormat? numberFormat; // Add this for number formatting

  QuantitativeComparisonChart({
    required String label,
    required this.primaryValue,
    required this.secondaryValue,
    this.primaryLabel = '',
    this.secondaryLabel = '',
    String unit = '',
    bool enableToolTip = false,
    this.themeData,
    this.numberFormat, // Add this
  }) : super(
            label: label,
            value: primaryValue,
            unit: unit,
            enableTooltip: enableToolTip);

  @override
  Widget buildChart() {
    // Default theme data
    const defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
      secondaryValueStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
      unitStyle: TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;
    TextStyle primaryValueStyle =
        themeData?.valueStyle ?? defaultThemeData.valueStyle;
    TextStyle secondaryValueStyle =
        themeData?.secondaryValueStyle ?? defaultThemeData.secondaryValueStyle;
    TextStyle unitStyle = themeData?.unitStyle ?? defaultThemeData.unitStyle;

    // Apply number formatting
    String formattedPrimaryValue = numberFormat?.format(primaryValue) ??
        NumberFormat().format(primaryValue);
    String formattedSecondaryValue = numberFormat?.format(secondaryValue) ??
        NumberFormat().format(secondaryValue);

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: labelStyle),
          const Spacer(),
          FittedBox(
              fit: BoxFit.contain,
              child: Text(formattedPrimaryValue, style: primaryValueStyle)),
          const Spacer(),
          const FittedBox(fit: BoxFit.contain, child: Text('vs')),
          const Spacer(),
          FittedBox(
              fit: BoxFit.contain,
              child: Text(formattedSecondaryValue, style: secondaryValueStyle)),
          const Spacer(),
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
