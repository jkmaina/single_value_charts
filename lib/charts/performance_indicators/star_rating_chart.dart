import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class StarRatingChart extends SingleValueChart {
  final double rating; // Assuming rating is out of 5
  final int totalStars;
  final ChartThemeData? themeData;

  StarRatingChart({
    required String label,
    required this.rating,
    this.totalStars = 5, // Default total stars
    String unit = 'stars',
    this.themeData,
  }) : super(label: label, value: rating, unit: unit);

  @override
  Widget buildChart() {
    // Define default theme data
    const defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.amber),
      unitStyle: TextStyle(color: Colors.grey, fontSize: 14),
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(totalStars, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber.shade900,
                size: 24,
              );
            }),
          ),
          const SizedBox(height: 2),
          Text('${rating.toStringAsFixed(1)}/$totalStars', style: valueStyle),
          const SizedBox(height: 2),
          Text(unit, style: defaultThemeData.unitStyle)
        ],
      ),
    );
  }
}