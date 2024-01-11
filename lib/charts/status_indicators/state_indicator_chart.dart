// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class StateIndicatorChart extends SingleValueChart {
  final String state; // Operational state or status
    @override
  final ChartThemeData? themeData;

  StateIndicatorChart({
    required String label,
    required this.state,
    this.themeData,
  }) : super(label: label, value: state, unit: '');

  @override
  Widget buildChart() {
    // Define default theme data
    final defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: _getStateColor(state)),
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
          // Custom state indicator representation
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_getStateIcon(state),
                  color: _getStateColor(state), size: 40),
              const SizedBox(width: 8),
              Text(state, style: valueStyle),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getStateIcon(String state) {
    // Define icons based on state
    switch (state.toLowerCase()) {
      case 'operational':
        return Icons.check_circle; // Example icon for operational
      case 'maintenance':
        return Icons.build_circle; // Example icon for maintenance
      case 'offline':
        return Icons.error; // Example icon for offline
      default:
        return Icons.help_outline; // Default icon for unknown states
    }
  }

  Color _getStateColor(String state) {
    // Define color based on state
    switch (state.toLowerCase()) {
      case 'operational':
        return Colors.green; // Green for operational
      case 'maintenance':
        return Colors.orange; // Orange for maintenance
      case 'offline':
        return Colors.red; // Red for offline
      default:
        return Colors.grey; // Grey for unknown states
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
