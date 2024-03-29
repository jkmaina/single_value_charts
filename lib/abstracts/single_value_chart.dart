import 'package:flutter/material.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';

import '../customization/chart_theme_data.dart';

abstract class SingleValueChart {
  final String label;
  final dynamic value;
  final String unit;
  final Color? color;
  final double? fontSize;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final String? semanticLabel; // For accessibility
  final ChartThemeData? themeData;
  final TooltipSettings tooltipSettings;
  final bool enableTooltip;

  SingleValueChart(
      {required this.label,
      required this.value,
      this.unit = '',
      this.color,
      this.fontSize,
      this.margin,
      this.padding,
      this.onTap,
      this.semanticLabel,
      this.themeData,
      this.enableTooltip = false,
      this.tooltipSettings = const TooltipSettings()});

  // Validation method (optional, based on requirements)
  void validateData() {
    if (value == null) {
      throw ArgumentError("Value cannot be null");
    }
    // Additional validation checks...
  }

  // Abstract method to build the chart widget
  Widget buildChart();

  // Additional methods or properties can be added as needed
  Widget buildTooltip(BuildContext context, Offset globalPosition);
}
