// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class CustomerSatisfactionChart extends SingleValueChart {
  final double satisfactionScore;
  final int maxScore;
  @override
  final ChartThemeData? themeData;
  final NumberFormat? numberFormat; // Optional number formatting

  CustomerSatisfactionChart({
    required String label,
    required this.satisfactionScore,
    String unit = '',
    this.themeData,
    this.maxScore = 5,
    this.numberFormat,
  }) : super(label: label, value: satisfactionScore, unit: unit);

  @override
  Widget buildChart() {
    // Default theme data
    const defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
      unitStyle: TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;
    TextStyle scoreStyle = themeData?.valueStyle ?? defaultThemeData.valueStyle;
    TextStyle unitStyle = themeData?.unitStyle ?? defaultThemeData.unitStyle;
    // Apply number formatting
    String formattedScore = numberFormat?.format(satisfactionScore) ??
        satisfactionScore.toStringAsFixed(1); // Defaults to one decimal place

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(fit: BoxFit.contain, child: Text(label, style: labelStyle)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(maxScore, (index) {
              return Icon(
                index < satisfactionScore ? Icons.star : Icons.star_border,
                color: Colors.orange,
                size: 24,
              );
            }),
          ),
          FittedBox(
              fit: BoxFit.contain,
              child: Text('$formattedScore / $maxScore', style: scoreStyle)),
          FittedBox(fit: BoxFit.contain, child: Text(unit, style: unitStyle)),
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
