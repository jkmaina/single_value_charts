import 'package:flutter/material.dart';
import 'package:single_value_charts/single_value_charts.dart'; // Import your chart library

class ComparativeAnalysisChartsDemo extends StatelessWidget {
  const ComparativeAnalysisChartsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of chart widgets
    List<Widget> charts = [
      ComparativeMetricChart(
        label: 'Sales Comparison',
        primaryValue: 12000,
        secondaryValue: 9500,
        primaryLabel: 'This Year',
        secondaryLabel: 'Last Year',
      ).buildChart(),
      FinancialSummaryChart(
        label: 'Financial Summary',
        amount: 50000,
        description: 'Net Income',
      ).buildChart(),
      QuantitativeComparisonChart(
        label: 'Budget vs Actual',
        primaryValue: 50000,
        secondaryValue: 45000,
        primaryLabel: 'Budget',
        secondaryLabel: 'Actual',
      ).buildChart(),
      RankingChart(
        label: 'Leaderboard Position',
        rank: 3,
        category: 'Sales Region A',
      ).buildChart(),
      // Add more chart instances as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparative Analysis Charts Demo'),
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
