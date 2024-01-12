import 'package:flutter/material.dart';
import 'package:single_value_charts/single_value_charts.dart'; // Import your chart library

class ProgressTrackingChartsDemo extends StatelessWidget {
  const ProgressTrackingChartsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of chart widgets
    List<Widget> charts = [
      FitnessGoalChart(
        label: 'Daily Steps',
        progress: 7500,
        goal: 10000,
        unit: 'steps',
      ).buildChart(),
      MilestoneTrackerChart(
        label: 'Project Milestones',
        completedMilestones: 4,
        totalMilestones: 10,
      ).buildChart(),
      ProgressBarChart(
        label: 'Reading Progress',
        progress: 120,
        goal: 300,
        unit: 'pages',
      ).buildChart(),
      // Add more progress tracking chart instances as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Tracking Charts Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400, // Maximum item width
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 6 / 2, // Adjust the aspect ratio as needed
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
