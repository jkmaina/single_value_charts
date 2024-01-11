import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:single_value_charts/single_value_charts.dart'; // Import your chart library

void main() {
  testWidgets('TrendIndicatorChart displays correct data and trend icon', (WidgetTester tester) async {
  // Define a test chart
  final testChart = TrendIndicatorChart(
    label: 'Test Trend',
    currentValue: 100.0,
    trend: 'up',
    trendDetails: 'Positive trend',
  );

  // Build our chart and trigger a frame.
  await tester.pumpWidget(MaterialApp(home: Scaffold(body: testChart.buildChart())));

  // Assuming NumberFormat.compact() formats 100.0 to '100'
  final formattedValue = NumberFormat.compact().format(100.0);

  // Verify that the chart displays the correct label, value, and trend details.
  expect(find.text('Test Trend'), findsOneWidget);
  expect(find.text(formattedValue), findsOneWidget); // Match the formatted value
  expect(find.text('Positive trend'), findsOneWidget);

  // Verify that the correct trend icon is displayed.
  expect(find.byIcon(Icons.trending_up), findsOneWidget);
});

}
