// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class FinancialSummaryChart extends SingleValueChart {
  final num amount;
  final String description;
  @override
  final ChartThemeData? themeData;
  final NumberFormat? numberFormat; // Number formatting option

  FinancialSummaryChart({
    required String label,
    required this.amount,
    required this.description,
    String unit = '',
    bool enableToolTip = false,
    this.themeData,
    this.numberFormat, // Number formatting option
  }) : super(
            label: label,
            value: amount,
            unit: unit,
            enableTooltip: enableToolTip);

  @override
  Widget buildChart() {
    // Default theme data
    const defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
      unitStyle: TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;
    TextStyle amountStyle =
        themeData?.valueStyle ?? defaultThemeData.valueStyle;
    TextStyle descriptionStyle =
        themeData?.unitStyle ?? defaultThemeData.unitStyle;

    // Apply number formatting
    String formattedAmount =
        numberFormat?.format(amount) ?? NumberFormat().format(amount);

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(fit: BoxFit.contain, child: Text(label, style: labelStyle)),
          const Spacer(),
          FittedBox(
              fit: BoxFit.contain,
              child: Text('\$$formattedAmount',
                  style: amountStyle)), // Example formatting for currency
          const Spacer(),
          FittedBox(
              fit: BoxFit.contain,
              child: Text(description, style: descriptionStyle)),
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
