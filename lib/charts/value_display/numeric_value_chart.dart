import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';
import '../../abstracts/single_value_chart.dart';
import '../../customization/chart_theme_data.dart';

class NumericValueChart extends SingleValueChart {
  final num value;
  final NumberFormat? numberFormat;
  final ChartThemeData? themeData;

  NumericValueChart({
    required String label,
    required this.value,
    String unit = '',
    this.numberFormat,
    this.themeData,
  }) : super(label: label, value: value, unit: unit);

  @override
  Widget buildChart() {
    // Apply number formatting
    String formattedValue = numberFormat?.format(value) ?? '$value';

    // Define text styles, potentially based on the provided theme data
    TextStyle labelStyle =
        themeData?.labelStyle ?? const ChartThemeData().labelStyle;
    TextStyle valueStyle = themeData?.valueStyle ??
        const ChartThemeData()
            .valueStyle
            .copyWith(fontSize: 38); // Enlarged for emphasis
    TextStyle unitStyle =
        themeData?.unitStyle ?? const ChartThemeData().unitStyle;

    // Construct the chart widget using the ChartCard for common styling
    return ChartCard(
      themeData: themeData ?? const ChartThemeData(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: labelStyle),
          const Spacer(),
          Text(formattedValue, style: valueStyle),
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
