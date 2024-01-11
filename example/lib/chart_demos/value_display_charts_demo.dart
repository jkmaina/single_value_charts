import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:single_value_charts/single_value_charts.dart'; // Importing the library

class ValueDisplayChartsDemo extends StatelessWidget {
  const ValueDisplayChartsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // List of chart widgets
    List<Widget> charts = [
      NumericValueChart(
        label: 'Total Users',
        value: 12345,
        unit: 'users',
        numberFormat: NumberFormat.compact(), // Example formatting
      ).buildChart(),
      TextualStatusChart(
        label: 'System Status',
        status: 'Operational',
        statusColor: Colors.green, // Color indicating the system is operational
      ).buildChart(),
      CustomKpiChart(
        label: 'Customer Satisfaction',
        value: 98.5,
        unit: '%',
        color: Colors.purple, // Custom color for the KPI chart
      ).buildChart(),
      // Add more chart instances as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Value Display Charts Demo'),
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
