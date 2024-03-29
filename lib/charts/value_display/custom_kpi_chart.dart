// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:single_value_charts/single_value_charts.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class CustomKpiChart extends SingleValueChart {
  @override
  final num value;
  @override
  final ChartThemeData? themeData;
  @override
  final Color color;

  CustomKpiChart({
    required String label,
    required this.value,
    String unit = '',
    this.themeData,
    this.color = Colors.blue,
  }) : super(label: label, value: value, unit: unit, color: color);

  @override
  Widget buildChart() {
    // Define text styles from theme data
    TextStyle labelStyle = themeData?.labelStyle ??
        const ChartThemeData().labelStyle.copyWith(color: color);
    TextStyle valueStyle =
        themeData?.valueStyle ?? const ChartThemeData().valueStyle;

    TextStyle unitStyle = themeData?.unitStyle ??
        const ChartThemeData().unitStyle.copyWith(color: color);

    // Construct the KPI chart widget using the ChartCard for styling
    return ChartCard(
      themeData: themeData ?? const ChartThemeData(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(fit: BoxFit.contain, child: Text(label, style: labelStyle)),
          const Spacer(),
          FittedBox(
              fit: BoxFit.contain,
              child: Text(value.toString(), style: valueStyle)),
          const Spacer(),
          FittedBox(fit: BoxFit.contain, child: Text(unit, style: unitStyle)),
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
