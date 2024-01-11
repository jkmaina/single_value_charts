import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class MilestoneTrackerChart extends SingleValueChart {
  final int completedMilestones;
  final int totalMilestones;
  final ChartThemeData? themeData;

  MilestoneTrackerChart({
    required String label,
    required this.completedMilestones,
    required this.totalMilestones,
    String unit = '',
    this.themeData,
  }) : super(label: label, value: completedMilestones.toDouble(), unit: unit);

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

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: labelStyle),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(totalMilestones, (index) {
              return Icon(
                index < completedMilestones ? Icons.check_circle : Icons.circle,
                color: index < completedMilestones ? Colors.green : Colors.grey,
                size: 24,
              );
            }),
          ),
          const SizedBox(height: 4),
          Text('$completedMilestones/$totalMilestones Completed',
              style: valueStyle),
        ],
      ),
    );
  }
}
