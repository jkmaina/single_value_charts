# Example Usage of Single Value Charts Library
This guide will walk you through the process of implementing charts from the Single Value Charts Library in a Flutter application.

## Using a Chart
Below is a simple example of how to implement a basic numeric chart in a basic app:

```dart
import 'package:flutter/material.dart';
import 'package:single_value_charts/single_value_charts.dart';

class MyChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single Value Chart Example'),
      ),
      body: Center(
        child: NumericValueChart(
          label: 'Total Users',
          value: 12345,
          unit: 'users',
        ).buildChart(),
      ),
    );
  }
}
```

## Customizing the Chart
You can customize the chart's appearance. For instance, to change the color and size:

```dart
NumericValueChart(
  label: 'Total Users',
  value: 12345,
  unit: 'users',
  color: Colors.blue,
  fontSize: 24,
).buildChart(),
```

## Adding Interactivity
To add interactive tooltips to the chart:

```dart
NumericValueChart(
  label: 'Total Users',
  value: 12345,
  unit: 'users',
  enableTooltip: true,
  tooltipSettings: TooltipSettings(
    backgroundColor: Colors.black,
    textStyle: TextStyle(color: Colors.white),
  ),
).buildChart(),
```

## More Examples
For more examples, including different chart types and customization options, please refer to the /example directory in the package.