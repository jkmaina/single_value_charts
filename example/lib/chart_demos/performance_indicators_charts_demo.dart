import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:single_value_charts/single_value_charts.dart'; // Import your chart library

class PerformanceIndicatorsChartsDemo extends StatelessWidget {
  const PerformanceIndicatorsChartsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of chart widgets
    List<Widget> charts = [
      CustomerSatisfactionChart(
        label: 'Customer Satisfaction',
        satisfactionScore: 4.7,
        unit: 'stars',
        numberFormat: NumberFormat('#.#'),
      ).buildChart(),
      EconomicIndicatorChart(
        label: 'Economic Indicator',
        indicatorValue: 2.5,
        maxValue: 5,
        unit: 'Inflation Rate',
      ).buildChart(),
      FinancialIndicatorChart(
        label: 'Financial Indicator',
        value: 1000,
        unit: 'USD',
        isIncrease: true,
        numberFormat: NumberFormat('#.##'),
      ).buildChart(),
      ProductionEfficiencyChart(
        label: 'Production Efficiency',
        efficiency: 85,
        unit: '%',
      ).buildChart(),
      QualityScoreChart(
        label: 'Quality Score',
        score: 92,
        unit: '%',
      ).buildChart(),
      StarRatingChart(
        label: 'Rating',
        rating: 4.5,
        unit: 'stars',
      ).buildChart(),
      // Add more charts as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Performance Indicators Charts Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300, // Maximum item width
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3.5 / 2, // Adjust the aspect ratio as needed
            mainAxisExtent: 200,
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
