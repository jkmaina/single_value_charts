import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class RankingChart extends SingleValueChart {
  final int rank;
  final String category;
  final ChartThemeData? themeData;
  final NumberFormat? numberFormat;

  RankingChart(
      {required String label,
      required this.rank,
      this.category = '',
      this.themeData,
      this.numberFormat})
      : super(label: label, value: rank);

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
          Text(label, style: labelStyle),
          const SizedBox(height: 4),
          Text(formattedRank, style: rankStyle),
          if (category.isNotEmpty) ...[
            const SizedBox(height: 2),
            Text(category, style: unitStyle),
          ],
        ],
      ),
    );
  }
}
