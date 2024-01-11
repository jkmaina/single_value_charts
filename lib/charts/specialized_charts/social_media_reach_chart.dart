import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:single_value_charts/abstracts/single_value_chart.dart';
import 'package:single_value_charts/customization/chart_theme_data.dart';
import 'package:single_value_charts/interaction/tool_tip.dart';
import 'package:single_value_charts/widgets/chart_card.dart';

class SocialMediaReachChart extends SingleValueChart {
  final int followersCount; // Number of followers or likes
  final String platform; // Name of the social media platform
  final ChartThemeData? themeData;

  SocialMediaReachChart({
    required String label,
    required this.followersCount,
    required this.platform,
    this.themeData,
  }) : super(label: label, value: followersCount.toDouble(), unit: '');

  @override
  Widget buildChart() {
    // Define default theme data
    final defaultThemeData = ChartThemeData(
      backgroundColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
      valueStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: _getPlatformColor(platform)),
      unitStyle: const TextStyle(color: Colors.grey, fontSize: 14),
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
          Icon(_getPlatformIcon(platform),
              color: _getPlatformColor(platform), size: 40),
          const SizedBox(height: 4),
          Text(NumberFormat.compact().format(followersCount),
              style: valueStyle),
        ],
      ),
    );
  }

  IconData _getPlatformIcon(String platform) {
    // Define platform-specific icons
    switch (platform.toLowerCase()) {
      case 'instagram':
        return Icons.camera_alt; // Example icon for Instagram
      case 'twitter':
        return Icons.chat_bubble; // Example icon for Twitter
      // Add more platforms and their icons
      default:
        return Icons.web; // Default icon for other platforms
    }
  }

  Color _getPlatformColor(String platform) {
    // Define platform-specific colors
    switch (platform.toLowerCase()) {
      case 'instagram':
        return Colors.purple;
      case 'twitter':
        return Colors.lightBlue;
      // Add more platforms and their colors
      default:
        return Colors.grey;
    }
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
