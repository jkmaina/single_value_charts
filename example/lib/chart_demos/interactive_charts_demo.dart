import 'package:flutter/material.dart';
import 'package:single_value_charts/single_value_charts.dart'; // Import your chart library

class InteractiveChartsDemo extends StatefulWidget {
  const InteractiveChartsDemo({Key? key}) : super(key: key);

  @override
  State<InteractiveChartsDemo> createState() => _InteractiveChartsDemoState();
}

class _InteractiveChartsDemoState extends State<InteractiveChartsDemo> {
  OverlayEntry? _overlayEntry;
  List<Widget> charts = [];
  List<SingleValueChart> chartInstances = [
    // List of chart instances
    RankingChart(
      label: 'Ranking',
      rank: 1,
      category: 'Category',
      enableToolTip: true,
    ),
    ComparativeMetricChart(
      label: 'Comparative Metric',
      primaryValue: 100,
      secondaryValue: 200,
      primaryLabel: 'Primary',
      secondaryLabel: 'Secondary',
      enableToolTip: true,
    ),
    FinancialSummaryChart(
      label: 'Financial Summary',
      amount: 1000000,
      description: 'Description',
      enableToolTip: true,
    ),
    QuantitativeComparisonChart(
      label: 'Quantitative Comparison',
      primaryValue: 100,
      secondaryValue: 200,
      enableToolTip: true,
    ),
  ];

  @override
  void initState() {
    super.initState();
    charts = chartInstances.map((chart) => chart.buildChart()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Charts Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2,
            mainAxisExtent: 200, 
          ),
          itemCount: charts.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTapDown: (details) => _showTooltip(context, details, index),
              onTapUp: (_) => _hideTooltip(),
              child: charts[index],
            );
          },
        ),
      ),
    );
  }

  void _showTooltip(BuildContext context, TapDownDetails details, int index) {
    var chart = chartInstances[index];
    Widget tooltip = chart.buildTooltip(context, details.globalPosition);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: details.globalPosition.dy,
        left: details.globalPosition.dx,
        child: Material(
          elevation: 4,
          child: tooltip,
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideTooltip() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
