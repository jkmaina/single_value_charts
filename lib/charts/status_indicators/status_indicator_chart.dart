// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class StatusIndicatorChart extends SingleValueChart {
  final String status; // The status message to be displayed
  @override
  final ChartThemeData? themeData;

  StatusIndicatorChart({
    required String label,
    required this.status,
    this.themeData,
  }) : super(label: label, value: status, unit: '');

  @override
  Widget buildChart() {
    // Define default theme data
    final defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: _getStatusColor(status)),
      unitStyle: const TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;
    TextStyle valueStyle = themeData?.valueStyle ?? defaultThemeData.valueStyle;

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label,
              style: labelStyle), // Removed FittedBox for better text scaling
          const SizedBox(height: 8), // Spacing between label and status icon
          // Custom representation of the status
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_getStatusIcon(status),
                  color: _getStatusColor(status), size: 40),
              const SizedBox(width: 8), // Spacing between icon and text
              Text(status,
                  style:
                      valueStyle), // Removed FittedBox for better text scaling
            ],
          ),
        ],
      ),
    );
  }

  IconData _getStatusIcon(String status) {
    // Define icons based on status
    switch (status.toLowerCase()) {
      case 'active':
        return Icons.check_circle; // Example icon for active status
      case 'inactive':
        return Icons.pause_circle_filled; // Example icon for inactive status
      case 'error':
        return Icons.error; // Example icon for error status
      default:
        return Icons.help_outline; // Default icon for other statuses
    }
  }

  Color _getStatusColor(String status) {
    // Define color based on status
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green; // Green for active
      case 'inactive':
        return Colors.yellow; // Yellow for inactive
      case 'error':
        return Colors.red; // Red for error
      default:
        return Colors.grey; // Grey for other statuses
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
