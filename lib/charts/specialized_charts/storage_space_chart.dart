// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class StorageSpaceChart extends SingleValueChart {
  final double usedStorage; // Used storage space
  final double totalStorage; // Total available storage space
  @override
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
          FittedBox(fit: BoxFit.contain, child: Text(label, style: labelStyle)),
          const Spacer(),
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
              FittedBox(
                  fit: BoxFit.contain,
                  child: Text('${(usedPercentage * 100).toStringAsFixed(1)}%',
                      style: valueStyle)),
            ],
          ),
          const Spacer(),
          FittedBox(
              fit: BoxFit.contain,
              child: Text(
                  'Used: ${NumberFormat.compact().format(usedStorage)} / ${NumberFormat.compact().format(totalStorage)} GB',
                  style: valueStyle)),
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
