import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class GoalMeterChart extends SingleValueChart {
  final double currentProgress; // Current progress towards the goal
  final double targetGoal; // The target goal value
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
          Text(label, style: labelStyle),
          const SizedBox(height: 8),
          CircularProgressIndicator(
            value: progressPercent,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
          ),
          const SizedBox(height: 4),
          Text('${currentProgress.toStringAsFixed(1)}/$targetGoal$unit',
              style: valueStyle),
        ],
      ),
    );
  }
}
