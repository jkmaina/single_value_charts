// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class GoalMeterChart extends SingleValueChart {
  final double currentProgress; // Current progress towards the goal
  final double targetGoal; // The target goal value
  @override
  final ChartThemeData? themeData;

  GoalMeterChart({
    required String label,
    required this.currentProgress,
    required this.targetGoal,
    String unit = '',
    this.themeData,
  }) : super(label: label, value: currentProgress, unit: unit);

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

    double progressPercent = (currentProgress / targetGoal)
        .clamp(0, 1); // Ensure the value is between 0 and 1

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(fit: BoxFit.contain, child: Text(label, style: labelStyle)),
          const Spacer(),
          CircularProgressIndicator(
            value: progressPercent,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
          ),
          const Spacer(),
          FittedBox(
              fit: BoxFit.contain,
              child: Text(
                  '${currentProgress.toStringAsFixed(1)}/$targetGoal$unit',
                  style: valueStyle)),
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
