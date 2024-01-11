import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class NetworkSignalChart extends SingleValueChart {
  final int signalStrength; // Represents the strength of the network signal
  final ChartThemeData? themeData;

  NetworkSignalChart({
    required String label,
    required this.signalStrength, // Value should be in the range of 0-5 typically
    this.themeData,
  }) : super(label: label, value: signalStrength.toDouble(), unit: 'bars');

  @override
  Widget buildChart() {
    // Define default theme data
    const defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
      unitStyle: TextStyle(color: Colors.grey, fontSize: 14),
    );

    TextStyle labelStyle = themeData?.labelStyle ?? defaultThemeData.labelStyle;
    TextStyle valueStyle = themeData?.valueStyle ?? defaultThemeData.valueStyle;

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Display the label at the top
          Text(label, style: labelStyle),
          SizedBox(height: 8),
          // Display signal bars as icons based on signal strength
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return Icon(
                index < signalStrength
                    ? Icons.signal_cellular_4_bar
                    : Icons.signal_cellular_off,
                color: index < signalStrength ? Colors.green : Colors.grey,
                size: 24,
              );
            }),
          ),
          SizedBox(height: 4),
          // Display the signal strength in textual format
          Text('$signalStrength bars', style: valueStyle),
        ],
      ),
    );
  }
}
