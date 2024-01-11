// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class UsageMeterChart extends SingleValueChart {
  final double currentUsage; // Current usage value
  final double maxUsage; // Maximum usage capacity
    @override
  final ChartThemeData? themeData;

  UsageMeterChart({
    required String label,
    required this.currentUsage,
    required this.maxUsage,
    this.themeData,
  }) : super(label: label, value: currentUsage, unit: '');

  @override
  Widget buildChart() {
    // Define default theme data
    const defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
      unitStyle: TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;
    TextStyle valueStyle = themeData?.valueStyle ?? defaultThemeData.valueStyle;

    // Calculate the usage percentage
    double usagePercentage = (currentUsage / maxUsage).clamp(0, 1);

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: labelStyle),
          const SizedBox(height: 8),
          // Custom meter-like visualization
          LinearProgressIndicator(
            value: usagePercentage,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
                usagePercentage > 0.75 ? Colors.red : Colors.green),
          ),
          const SizedBox(height: 4),
          Text(
              '${(usagePercentage * 100).toStringAsFixed(1)}% used of ${NumberFormat.compact().format(maxUsage)}',
              style: valueStyle),
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
