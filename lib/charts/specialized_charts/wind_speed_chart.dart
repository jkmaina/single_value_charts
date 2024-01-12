// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class WindSpeedChart extends SingleValueChart {
  final double windSpeed; // Wind speed value
  @override
  final ChartThemeData? themeData;

  WindSpeedChart({
    required String label,
    required this.windSpeed, // Wind speed in mph, km/h, etc.
    String unit = 'mph',
    this.themeData,
  }) : super(label: label, value: windSpeed, unit: unit);

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

    return ChartCard(
      themeData: themeData ?? defaultThemeData,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(fit: BoxFit.contain, child: Text(label, style: labelStyle)),
          const Spacer(),
          // Custom wind indicator visualization (e.g., animated windmill icon)
          _buildWindIndicator(windSpeed),
          const Spacer(),
          FittedBox(
              fit: BoxFit.contain,
              child: Text('${windSpeed.toStringAsFixed(1)} $unit',
                  style: valueStyle)),
        ],
      ),
    );
  }

  Widget _buildWindIndicator(double speed) {
    return RotatingWindmillIcon(speed: speed);
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

class RotatingWindmillIcon extends StatefulWidget {
  final double speed;

  const RotatingWindmillIcon({Key? key, required this.speed}) : super(key: key);

  @override
  RotatingWindmillIconState createState() => RotatingWindmillIconState();
}

class RotatingWindmillIconState extends State<RotatingWindmillIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(
          milliseconds: (400 - widget.speed * 30).clamp(50, 350).toInt()),
      vsync: this,
    )..repeat();
  }

  @override
  void didUpdateWidget(covariant RotatingWindmillIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.speed != widget.speed) {
      _controller.duration = Duration(
          milliseconds: (400 - widget.speed * 30).clamp(50, 350).toInt());
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      child: const Icon(Icons.toys,
          size: 40), // Replace with an appropriate windmill icon
    );
  }
}
