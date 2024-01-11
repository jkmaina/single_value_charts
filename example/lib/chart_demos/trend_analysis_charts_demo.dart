import 'package:flutter/material.dart';
import 'package:single_value_charts/single_value_charts.dart'; // Import your chart library

class TrendAnalysisChartsDemo extends StatelessWidget {
  const TrendAnalysisChartsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of trend analysis chart widgets
    List<Widget> charts = [
      ChangeIndicatorChart(
        label: 'Quarterly Sales Change',
        value: 15000.0,
        change: 1200.0,
        unit: 'USD',
      ).buildChart(),
      TrendIndicatorChart(
        label: 'Monthly User Growth',
        currentValue: 12000.0,
        trend: 'up',
        trendDetails: '15% increase from last month',
      ).buildChart(),
      // Add more trend analysis chart instances here...
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Specialized Charts Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300, // Maximum item width
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2, // Adjust the aspect ratio as needed
          ),
          itemCount: charts.length,
          itemBuilder: (context, index) {
            return charts[index];
          },
        ),
      ),
    );
  }
}
