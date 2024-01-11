import 'package:example/chart_demo_widget.dart';
import 'package:example/chart_demos/performance_indicators_charts_demo.dart';
import 'package:example/chart_demos/progress_tracking_charts_demo.dart';
import 'package:example/chart_demos/specialized_chart_demo.dart';
import 'package:example/chart_demos/status_indicators_charts_demo.dart';
import 'package:example/chart_demos/trend_analysis_charts_demo.dart';
import 'package:flutter/material.dart';
import 'chart_demos/value_display_charts_demo.dart';
import 'chart_demos/comparative_analysis_charts_demo.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});

  final List<ChartDemo> demos = [
    ChartDemo(
      title: 'Value Display Charts',
      builder: (context) => const ValueDisplayChartsDemo(),
    ),
    ChartDemo(
      title: 'Comparative Analysis Charts',
      builder: (context) => const ComparativeAnalysisChartsDemo(),
    ),
    ChartDemo(
      title: 'Performance Indicators Charts',
      builder: (context) => const PerformanceIndicatorsChartsDemo(),
    ),
    ChartDemo(
      title: 'Progress Tracking Charts',
      builder: (context) => const ProgressTrackingChartsDemo(),
    ),
    ChartDemo(
      title: 'Specialized Charts',
      builder: (context) => const SpecializedChartsDemo(),
    ),
    ChartDemo(
      title: 'Status Indicator Charts',
      builder: (context) => const StatusIndicatorsChartsDemo(),
    ),
    ChartDemo(
      title: 'Trend Analysis Charts',
      builder: (context) => const TrendAnalysisChartsDemo(),
    ),
    // Add more ChartDemo instances as you create more demos
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chart Gallery'),
      ),
      body: ListView.builder(
        itemCount: demos.length,
        itemBuilder: (context, index) {
          var demo = demos[index];
          return ListTile(
            title: Text(demo.title),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: demo.builder),
            ),
          );
        },
      ),
    );
  }
}
