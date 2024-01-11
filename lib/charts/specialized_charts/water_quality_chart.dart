import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class WaterQualityChart extends SingleValueChart {
  final double purityIndex; // Water purity index value
  final ChartThemeData? themeData;

  WaterQualityChart({
    required String label,
    required this.purityIndex,
    this.themeData,
  }) : super(label: label, value: purityIndex, unit: '%');

  @override
  Widget buildChart() {
    // Define default theme data
    final defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: _getPurityColor(purityIndex)),
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
          // Custom visualization for water purity
          LinearProgressIndicator(
            value: purityIndex / 100,
            backgroundColor: Colors.grey[300],
            valueColor:
                AlwaysStoppedAnimation<Color>(_getPurityColor(purityIndex)),
          ),
          const SizedBox(height: 4),
          Text('${purityIndex.toStringAsFixed(1)}% Purity', style: valueStyle),
        ],
      ),
    );
  }

  Color _getPurityColor(double purity) {
    // Define color based on water purity
    if (purity >= 90) {
      return Colors.blue; // High purity
    } else if (purity >= 70) {
      return Colors.yellow; // Medium purity
    } else {
      return Colors.red; // Low purity
    }
  }
}
