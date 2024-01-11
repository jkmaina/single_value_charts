import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class TemperatureGaugeChart extends SingleValueChart {
  final double temperature; // Current temperature value
  final double minTemp; // Minimum scale value for the gauge
  final double maxTemp; // Maximum scale value for the gauge
  final ChartThemeData? themeData;

  TemperatureGaugeChart({
    required String label,
    required this.temperature,
    this.minTemp = 0,
    this.maxTemp = 100,
    this.themeData,
  }) : super(label: label, value: temperature, unit: '°C');

  @override
  Widget buildChart() {
    // Define default theme data
    var defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Colors.orange),
      unitStyle: TextStyle(color: Colors.grey.shade900, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;
    TextStyle valueStyle = themeData?.valueStyle ?? defaultThemeData.valueStyle;
    TextStyle unitStyle = themeData?.unitStyle ?? defaultThemeData.unitStyle;

    // Calculate the position of the needle on the gauge
    double needlePosition = (temperature - minTemp) / (maxTemp - minTemp);

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: labelStyle),
          const SizedBox(height: 8),
          // Custom gauge visualization
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  value: needlePosition,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
              Text('${temperature.toStringAsFixed(1)}°C', style: valueStyle),
            ],
          ),
          const SizedBox(height: 4),
          Text('Range: $minTemp°C to $maxTemp°C', style: unitStyle),
        ],
      ),
    );
  }
}
