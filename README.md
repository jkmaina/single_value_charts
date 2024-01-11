# single_value_charts

A Flutter package for rendering versatile and customizable single value charts. Ideal for dashboards, analytics, and data visualization tasks. Supports a wide range of chart types like trend indicators, status charts, and more.

## Getting Started

### Installation

To use `single_value_charts` in your Flutter app, add it to your dependencies:

```yaml
dependencies:
  single_value_charts: ^1.0.0
```

### Basic Setup

Import the package in your Dart code:

```dart
import 'package:single_value_charts/single_value_charts.dart';
```

## Usage Examples

### TrendIndicatorChart

Displays a trend with an indicator arrow.

```dart
TrendIndicatorChart(
  label: 'Revenue',
  currentValue: 20000,
  trend: 'down',
  trendDetails: '10% decrease since last month',
)
```

![TrendIndicatorChart Example](https://github.com/jkmaina/single_value_charts/blob/main/example/lib/example_images/technical_indicator_chart.png)

## Gallery of Chart Types

Here's a preview of our gallery screen showcasing various chart types:

![Gallery Screen](https://github.com/jkmaina/single_value_charts/blob/main/example/lib/example_images/example_chart_gallery.png)

## API Reference

A detailed description of all public classes, methods, properties, and parameters. Include default values and data types.

## Customizations

`single_value_charts` offers extensive customization options to tailor the look and feel of the charts to match your application's design. Below are some examples of customizations you can apply:

### Changing Chart Colors and Styles

Each chart supports customization through `ChartThemeData`, which allows you to modify aspects like color, text style, and more.

#### Example: Customizing a Trend Indicator Chart

```dart
TrendIndicatorChart(
  label: 'User Growth',
  currentValue: 1500,
  trend: 'up',
  trendDetails: '15% increase',
  themeData: ChartThemeData(
    backgroundColor: Colors.blueGrey[50],
    labelStyle: TextStyle(fontSize: 18, color: Colors.blueGrey),
    valueStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
  ),
)
```

This example demonstrates how to change the background color, label, and value styles of a `TrendIndicatorChart`.

### Customizing Chart Interactions

You can also customize the interactive elements of the charts, like tooltips and touch responses.

#### Example: Enabling Tooltips on a Change Indicator Chart

```dart
ChangeIndicatorChart(
  label: 'Quarterly Sales',
  value: 25000,
  change: 3000,
  unit: 'USD',
  enableTooltip: true, // Enable tooltip on touch
  tooltipSettings: TooltipSettings(
    tooltipColor: Colors.black,
    textStyle: TextStyle(color: Colors.white),
  ),
)
```

This example shows how to enable tooltips on a `ChangeIndicatorChart` and customize the tooltip appearance.

### Responsiveness and Layout

Our charts are designed to be responsive, adapting to different screen sizes and orientations.

#### Example: Setting Minimum and Maximum Sizes

```dart
ConstrainedBox(
  constraints: BoxConstraints(
    minWidth: 200,
    maxWidth: 400,
    minHeight: 100,
    maxHeight: 200,
  ),
  child: TrendIndicatorChart(
    // Chart configuration
  ),
)
```

By wrapping the chart in a `ConstrainedBox`, you can define the minimum and maximum size of the chart, ensuring it adapts well to different screen sizes.


## Interactivity

Explain how to implement interactive features like tooltips and click events.

## Performance and Optimization

Tips on optimizing chart rendering, limitations, and best practices for large datasets.

## Troubleshooting

Common issues and their solutions.

## Contribution Guidelines

How to contribute to the package, coding standards, and guidelines for pull requests and issue reporting.

## License

`single_value_charts` is released under the MIT License.

```markdown
MIT License

Copyright (c) [2024] [Zavora Technologies Ltd]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

