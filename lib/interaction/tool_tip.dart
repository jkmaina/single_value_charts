import 'package:flutter/material.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';

class ChartToolTip extends StatelessWidget {
  final String message;
  final double top; // Y position
  final double left; // X position
  final TooltipSettings tooltipSettings;

  const ChartToolTip({
    Key? key,
    required this.message,
    required this.top,
    required this.left,
    required this.tooltipSettings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Material(
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.black,
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class TooltipSettings {
  final Color backgroundColor;
  final TextStyle textStyle;

  const TooltipSettings({
    this.backgroundColor = Colors.black,
    this.textStyle = const TextStyle(color: Colors.white),
  });
}
