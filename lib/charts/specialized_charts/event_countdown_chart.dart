// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/animated_countdown.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class EventCountdownChart extends SingleValueChart {
  final Duration timeUntilEvent;
  @override
  final ChartThemeData? themeData;
  bool animate = true;

  EventCountdownChart({
    required String label,
    required this.timeUntilEvent,
    this.themeData,
    String unit = 'days',
  }) : super(
            label: label,
            value: timeUntilEvent.inSeconds.toDouble(),
            unit: unit);

  @override
  Widget buildChart() {
    // Define default theme data
    const defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
      unitStyle: TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;
    TextStyle valueStyle = themeData?.valueStyle ?? defaultThemeData.valueStyle;

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(fit: BoxFit.contain, child: Text(label, style: labelStyle)),
          const Spacer(),
          AnimatedCountdownWidget(
              initialTime: timeUntilEvent,
              animate: animate,
              textStyle: valueStyle),
          const Spacer(),
          FittedBox(fit: BoxFit.contain, child: Text(unit, style: labelStyle)),
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
