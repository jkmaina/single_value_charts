import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class StorageSpaceChart extends SingleValueChart {
  final double usedStorage; // Used storage space
  final double totalStorage; // Total available storage space
  final ChartThemeData? themeData;

  StorageSpaceChart({
    required String label,
    required this.usedStorage,
    required this.totalStorage,
    this.themeData,
  }) : super(label: label, value: usedStorage, unit: 'GB');

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

    // Calculate the used storage percentage
    double usedPercentage = (usedStorage / totalStorage).clamp(0, 1);

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(label, style: labelStyle),
          const SizedBox(height: 8),
          // Custom graphical representation of storage space
          Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: usedPercentage,
                strokeWidth: 20,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
              ),
              Text('${(usedPercentage * 100).toStringAsFixed(1)}%',
                  style: valueStyle),
            ],
          ),
          const SizedBox(height: 4),
          Text(
              'Used: ${NumberFormat.compact().format(usedStorage)} / ${NumberFormat.compact().format(totalStorage)} GB',
              style: valueStyle),
        ],
      ),
    );
  }
}