// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class ThresholdStatusChart extends SingleValueChart {
  @override
  final double value; // The value to be displayed
  final double lowThreshold; // Lower threshold value
  final double highThreshold; // Upper threshold value
  @override
  final ChartThemeData? themeData;

  ThresholdStatusChart({
    required String label,
    required this.value,
    required this.lowThreshold,
    required this.highThreshold,
    this.themeData,
  }) : super(label: label, value: value, unit: '');

  @override
  Widget buildChart() {
    // Define default theme data
    final defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: _getValueColor(value, lowThreshold, highThreshold)),
      unitStyle: const TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;
    TextStyle valueStyle = themeData?.valueStyle ?? defaultThemeData.valueStyle;

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        mainAxisAlignment: MainAxisAlignment
            .center, // Aligns children to the center of the column
        children: [
          FittedBox(fit: BoxFit.contain, child: Text(label, style: labelStyle)),
          const SizedBox(height: 10), // Spacing for better layout
          // Centering the row of icons and values
          Center(
            child: Row(
              mainAxisSize: MainAxisSize
                  .min, // This ensures the row only takes as much space as needed
              children: [
                Icon(_getThresholdIcon(value, lowThreshold, highThreshold),
                    color: _getValueColor(value, lowThreshold, highThreshold),
                    size: 40),
                const SizedBox(width: 10), // Spacing between icon and value
                FittedBox(
                    fit: BoxFit.contain,
                    child: Text(value.toStringAsFixed(1), style: valueStyle)),
              ],
            ),
          ),
          const SizedBox(height: 10), // Spacing for better layout
          FittedBox(
              fit: BoxFit.contain,
              child: Text('Thresholds: $lowThreshold - $highThreshold',
                  style: valueStyle)),
        ],
      ),
    );
  }

  IconData _getThresholdIcon(double value, double low, double high) {
    if (value < low) {
      return Icons.arrow_downward; // Indicate below threshold
    } else if (value > high) {
      return Icons.arrow_upward; // Indicate above threshold
    } else {
      return Icons.check; // Indicate within threshold
    }
  }

  Color _getValueColor(double value, double low, double high) {
    // Define color based on value in relation to thresholds
    if (value < low) {
      return Colors.blue; // Color for below threshold
    } else if (value > high) {
      return Colors.red; // Color for above threshold
    } else {
      return Colors.green; // Color for within threshold
    }
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
