// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class TextualStatusChart extends SingleValueChart {
  final String status;
  @override
  final ChartThemeData? themeData;
  final Color statusColor;

  TextualStatusChart({
    required String label,
    required this.status,
    String unit = '',
    this.themeData,
    this.statusColor = Colors.green,
  }) : super(label: label, value: status, unit: unit, color: statusColor);

  @override
  Widget buildChart() {
    // Define text styles from theme data or defaults
    TextStyle labelStyle =
        themeData?.labelStyle ?? const ChartThemeData().labelStyle;
    TextStyle statusStyle = themeData?.valueStyle ??
        const ChartThemeData().valueStyle.copyWith(
            color: statusColor, fontSize: 28); // Highlighted status style
    TextStyle unitStyle =
        themeData?.unitStyle ?? const ChartThemeData().unitStyle;

    // Construct the status chart widget using the ChartCard for styling
    return ChartCard(
      themeData: themeData ?? const ChartThemeData(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: labelStyle),
          const Spacer(),
          Text(status, style: statusStyle),
          const Spacer(),
          Text(unit, style: unitStyle),
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
