// ignore_for_file: overridden_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/animated_countdown.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class CountdownTimerChart extends SingleValueChart {
  final Duration timeRemaining;
  @override
  final ChartThemeData? themeData;
  bool animate = true;

  CountdownTimerChart({
    required String label,
    required this.timeRemaining,
    this.themeData,
  }) : super(
            label: label,
            value: timeRemaining.inSeconds.toDouble(),
            unit: 'Time Remaining');

  @override
  Widget buildChart() {
    // Define default theme data
    const defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
      unitStyle: TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;
    TextStyle valueStyle = themeData?.valueStyle ?? defaultThemeData.valueStyle;

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(fit: BoxFit.contain, child: Text(label, style: labelStyle)),
          AnimatedCountdownWidget(
              initialTime: timeRemaining,
              animate: animate,
              textStyle: valueStyle),
          FittedBox(fit: BoxFit.contain, child: Text(unit, style: labelStyle))
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
