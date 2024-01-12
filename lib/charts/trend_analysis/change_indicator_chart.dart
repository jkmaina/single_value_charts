// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class ChangeIndicatorChart extends SingleValueChart {
  @override
  final double value; // Current value
  final double change; // Change value (can be positive or negative)
  @override
  final String unit; // Unit of measurement
  @override
  final ChartThemeData? themeData;

  ChangeIndicatorChart({
    required String label,
    required this.value,
    required this.change,
    this.unit = '',
    this.themeData,
  }) : super(label: label, value: value, unit: unit);

  @override
  Widget buildChart() {
    // Define default theme data
    final defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: _getChangeColor(change)),
      unitStyle: const TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;
    TextStyle valueStyle = themeData?.valueStyle ?? defaultThemeData.valueStyle;

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label,
              style: labelStyle), // Removed FittedBox for better text scaling
          const SizedBox(height: 8), // Spacing between label and icon
          // Row for icon and value representation
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_getChangeIcon(change),
                  color: _getChangeColor(change), size: 24),
              const SizedBox(width: 8), // Spacing between icon and value
              Text(
                  '${NumberFormat.compact().format(value)} (${_formatChange(change)})',
                  style:
                      valueStyle) // Removed FittedBox for better text scaling
            ],
          ),
        ],
      ),
    );
  }

  IconData _getChangeIcon(double change) {
    return change >= 0 ? Icons.trending_up : Icons.trending_down;
  }

  Color _getChangeColor(double change) {
    return change >= 0 ? Colors.green : Colors.red;
  }

  String _formatChange(double change) {
    return '${change >= 0 ? '+' : ''}${change.toStringAsFixed(2)}$unit';
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
