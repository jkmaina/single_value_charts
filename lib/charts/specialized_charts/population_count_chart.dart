// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class PopulationCountChart extends SingleValueChart {
  final int malePopulation; // Male population count
  final int femalePopulation; // Female population count
  @override
  final ChartThemeData? themeData;

  PopulationCountChart({
    required String label,
    required this.malePopulation,
    required this.femalePopulation,
    this.themeData,
  }) : super(
            label: label,
            value: malePopulation + femalePopulation.toDouble(),
            unit: 'People');

  @override
  Widget buildChart() {
    // Define default theme data
    const defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
      unitStyle: TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;
    TextStyle valueStyle = themeData?.valueStyle ?? defaultThemeData.valueStyle;

    // Format the population counts for better readability
    final formattedMalePopulation =
        NumberFormat.compact().format(malePopulation);
    final formattedFemalePopulation =
        NumberFormat.compact().format(femalePopulation);

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(fit: BoxFit.contain, child: Text(label, style: labelStyle)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Male population icon and count
              const Icon(Icons.male, color: Colors.blue),
              Text(formattedMalePopulation, style: valueStyle),
              const Spacer(),
              // Female population icon and count
              const Icon(Icons.female, color: Colors.pink),
              FittedBox(
                  fit: BoxFit.contain,
                  child: Text(formattedFemalePopulation, style: valueStyle)),
            ],
          ),
          // Total population count
          FittedBox(
              fit: BoxFit.contain,
              child: Text(
                  'Total: ${NumberFormat.compact().format(malePopulation + femalePopulation)}',
                  style: valueStyle)),
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
