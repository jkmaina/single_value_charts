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

![TrendIndicatorChart Example](path/to/trend_indicator_example.png)

### Other Chart Types

Include examples and descriptions for other chart types like `ChangeIndicatorChart`, `StatusIndicatorChart`, etc.

## API Reference

A detailed description of all public classes, methods, properties, and parameters. Include default values and data types.

## Customization

How users can customize charts (styles, colors, interaction behaviors). Document `ChartThemeData` and other styling classes in detail.

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
