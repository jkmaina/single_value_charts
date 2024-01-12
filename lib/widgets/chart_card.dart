import 'package:flutter/material.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';

class ChartCard extends StatelessWidget {
  final Widget child;
  final ChartThemeData themeData;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;

  const ChartCard({
    Key? key,
    required this.child,
    required this.themeData,
    this.padding,
    this.margin,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.all(4),
        margin: margin ?? const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: themeData.backgroundColor,
          borderRadius: themeData.borderRadius,
          boxShadow: [themeData.boxShadow],
        ),
        child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 300,
            ),
            child: IntrinsicWidth(child: IntrinsicHeight(child: child))),
      ),
    );
  }
}
