import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class ChangeIndicatorChart extends SingleValueChart {
  final double value; // Current value
  final double change; // Change value (can be positive or negative)
  final String unit; // Unit of measurement
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
        children: [
          Text(label, style: labelStyle),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_getChangeIcon(change),
                  color: _getChangeColor(change), size: 24),
              const SizedBox(width: 4),
              Text(
                  '${NumberFormat.compact().format(value)} (${_formatChange(change)})',
                  style: valueStyle),
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
