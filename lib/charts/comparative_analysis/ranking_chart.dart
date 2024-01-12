// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class RankingChart extends SingleValueChart {
  final int rank;
  final String category;
  @override
  final ChartThemeData? themeData;
  final NumberFormat? numberFormat;

  RankingChart(
      {required String label,
      required this.rank,
      this.category = '',
      this.themeData,
      bool enableToolTip = false,
      this.numberFormat})
      : super(label: label, value: rank, enableTooltip: enableToolTip);

  @override
  Widget buildChart() {
    // Default theme data
    const defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blue),
      unitStyle: TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;
    TextStyle rankStyle = themeData?.valueStyle ?? defaultThemeData.valueStyle;
    TextStyle unitStyle = themeData?.unitStyle ?? defaultThemeData.unitStyle;

    // Apply number formatting
    String formattedRank =
        numberFormat?.format(rank) ?? NumberFormat().format(rank);

    return ChartCard(
      themeData: themeData ?? const ChartThemeData(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(fit: BoxFit.contain, child: Text(label, style: labelStyle)),
          const Spacer(),
          FittedBox(
              fit: BoxFit.contain,
              child: Text(formattedRank, style: rankStyle)),
          if (category.isNotEmpty) ...[
            const Spacer(),
            FittedBox(
                fit: BoxFit.contain, child: Text(category, style: unitStyle)),
          ],
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
