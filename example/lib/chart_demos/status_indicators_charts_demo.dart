import 'package:flutter/material.dart';
import 'package:single_value_charts/single_value_charts.dart'; // Import your chart library

class StatusIndicatorsChartsDemo extends StatelessWidget {
  const StatusIndicatorsChartsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of status indicator chart widgets
    List<Widget> charts = [
      ThresholdStatusChart(
        label: 'Temperature',
        value: 75.0,
        lowThreshold: 65.0,
        highThreshold: 85.0,
      ).buildChart(),
      TrafficLightIndicatorChart(
        label: 'Operation Status',
        status: 'green',
      ).buildChart(),
      BatteryLevelChart(
        label: 'Device Battery',
        batteryLevel: 70.0,
      ).buildChart(),
      StateIndicatorChart(
        label: 'System State',
        state: 'Optimal',
      ).buildChart(),
      StatusIndicatorChart(
        label: 'Network Connectivity',
        status: 'Active',
      ).buildChart(),
      // Add more status indicator chart instances here...
      // Example: StateIndicatorChart, BatteryLevelChart, etc.
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Status Indicator Charts Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300, // Maximum item width
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2, // Adjust the aspect ratio as needed
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
