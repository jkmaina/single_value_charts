import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/widgets/chart_card.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:intl/intl.dart'; // For number formattin

class FinancialIndicatorChart extends SingleValueChart {
  final bool isIncrease; // Indicator for the trend - up or down
  final NumberFormat? numberFormat;

  FinancialIndicatorChart({
    required String label,
    required double value,
    String unit = '',
    this.isIncrease = false,
    ChartThemeData? themeData,
    this.numberFormat,
  }) : super(label: label, value: value, unit: unit, themeData: themeData);

  @override
  Widget buildChart() {
    TextStyle labelStyle = themeData?.labelStyle ??
        const TextStyle(color: Colors.black, fontSize: 16);
    TextStyle valueStyle = themeData?.valueStyle ??
        TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: isIncrease ? Colors.green : Colors.red);
    TextStyle unitStyle = themeData?.unitStyle ??
        const TextStyle(color: Colors.grey, fontSize: 14);

    // Apply number formatting
    String formattedValue =
        numberFormat?.format(value) ?? value.toStringAsFixed(2);

    return ChartCard(
      themeData: themeData ?? const ChartThemeData(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: labelStyle),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isIncrease ? Icons.trending_up : Icons.trending_down,
                color: isIncrease ? Colors.green : Colors.red,
              ),
              Text(formattedValue, style: valueStyle),
              Text(unit, style: unitStyle),
            ],
          ),
          // Optionally, add more widgets to represent additional data
        ],
      ),
    );
  }
}