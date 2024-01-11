# Single Value Charts Library for Flutter

Elevate your Flutter applications with the Single Value Charts Library - a versatile and performance-optimized charting solution designed to bring clarity and insight to your data visualization needs.

`single_value_charts` is a Flutter package for rendering versatile and customizable single value charts. Ideal for dashboards, analytics, and data visualization tasks. Supports a wide range of chart types like trend indicators, status charts, and more.

## Features
1. Wide Range of Chart Types: From basic numeric and textual charts to more complex comparative, trending, and status-indicative charts, our library covers a broad spectrum of visualization needs.
2. Highly Customizable: Tailor each chart to your aesthetic preferences with extensive styling options. Customize colors, sizes, labels, and more to match your app's design language.
3. Optimized for Performance: Built with Flutter's best practices, our charts ensure smooth rendering and efficient data handling, even with large datasets.
4. Interactive Tooltips: Enhance user experience with interactive tooltips, providing additional context and insights into your chart data.
5. Responsive and Adaptive: Whether it's a smartphone, tablet, or desktop, our charts are responsive and adapt seamlessly to different screen sizes.
6. Accessibility Ready: We believe in inclusivity; our charts are designed with accessibility in mind, ensuring that your apps are usable by as many people as possible.
7. Open Source: Dive into the code, customize, and contribute. Join our growing community of developers in enhancing this powerful charting library.

### Ideal for
1. Business Intelligence Dashboards
2. Data Analysis Tools
3. Financial Applications
4. Health and Fitness Apps
5. Environmental Monitoring Systems
6. Any application where data visualization plays a key role!

## Getting Started
Integrating Single Value Charts into your Flutter project is straightforward. Check out below documentation for installation instructions, examples, and customization guides.

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

### Tooltips

Our chart library supports interactive tooltips, enhancing the user experience by providing additional information on user interaction.

#### Enabling Tooltips

To enable tooltips on a chart, you need to set the `enableTooltip` flag to `true` when creating a chart instance. Here's an example:

```dart
var myChart = ComparativeMetricChart(
  label: 'Sales Comparison',
  primaryValue: 12000,
  secondaryValue: 9500,
  primaryLabel: 'This Year',
  secondaryLabel: 'Last Year',
  enableTooltip: true, // Enable tooltips
);
```

#### Customizing Tooltips

You can customize the appearance of tooltips using `TooltipSettings`. This includes settings for background color, text style, and more.

Example:

```dart
var myChart = ComparativeMetricChart(
  // ... other parameters ...
  enableTooltip: true,
  tooltipSettings: TooltipSettings(
    backgroundColor: Colors.blue,
    textStyle: TextStyle(color: Colors.white),
  ),
);
```
### Interactive Demos

In the `InteractiveChartsDemo` class, we demonstrate how to implement interactive charts with tooltips. This includes handling user tap events to show and hide tooltips appropriately.

```dart
class InteractiveChartsDemo extends StatefulWidget {
  // ... StatefulWidget implementation ...
}

class _InteractiveChartsDemoState extends State<InteractiveChartsDemo> {
  // ... State implementation including _showTooltip and _hideTooltip methods ...
}
```

Ensure to check out the full implementation in our example directory for more details on interactive chart features.

## Troubleshooting

Common issues and their solutions.

1. Charts Not Rendering Properly
Description: Sometimes charts might not render as expected.
Solution: Ensure all required parameters are correctly set. If using custom data models, verify their integrity. Also, check if the parent widget constrains the chart size too much.

2. Performance Issues
Description: Charts lagging or causing the app to run slowly.
Solution: Optimize data size and aggregation. Avoid unnecessary state updates. Use RepaintBoundary for static charts.
3. Tooltip Not Displaying

Description: Tooltips are not showing when they are supposed to.
Solution: Check if enableTooltip is set to true. Ensure that the tooltip settings are correctly configured. Verify that gesture detection for tooltips is implemented correctly.

4. Customization Not Applied
Description: Custom styles or settings not reflected in charts.
Solution: Confirm that the customization parameters are passed correctly to the chart. If using themes, ensure they are correctly scoped in your app.

### Reporting Issues
If you encounter an issue that's not listed here, or the suggested solutions don't work, please report it on our GitHub Issues page. When reporting an issue, please include:

- A clear and descriptive title
- Detailed steps to reproduce the problem
- Flutter version and chart library version
- Code snippets or a link to a minimal project where the issue is reproducible
- Any relevant logs or error messages

## Contribution Guidelines

How to contribute to the package, coding standards, and guidelines for pull requests and issue reporting.

We welcome and appreciate contributions from the community! Whether it's fixing bugs, improving documentation, or suggesting new features, your help is valuable. Here's how you can contribute:

### Getting Started
Fork the Repository: Start by forking the repository to your own GitHub account.
Clone the Forked Repository: Clone the repository to your local machine to start working on your changes.
### Making Contributions
Choose an Issue: Look for open issues that you are interested in solving. Feel free to ask questions or propose new issues if you have ideas.
Create a Branch: Create a new branch in your fork for your contribution. Naming it relevantly (e.g., fix/memory-leak, feature/add-new-chart-type) helps identify its purpose.
Implement Your Changes: Work on the changes in your branch. Make sure you adhere to the coding standards and guidelines of the project.
Write or Update Tests: Ensure that your changes are properly tested. Update existing tests or write new ones as necessary.
Document Your Changes: Update the README or documentation to reflect any changes, especially if adding features or making changes that affect users.
### Submitting a Pull Request
Commit Your Changes: Commit your changes with a clear and descriptive commit message.
Push to Your Fork: Push the changes to your forked repository.
Create a Pull Request: Open a pull request to the main repository. Provide a clear description of the changes and reference any related issues.
Code Review: Once you've submitted a pull request, maintainers will review your changes. Be open to feedback and make any necessary adjustments.
Merging: If your changes are approved, a maintainer will merge them into the main repository.
### Guidelines
Code Style: Follow the coding style and conventions used in the project.
Quality: Ensure your code is clean, well-organized, and efficient.
Testing: Strive to maintain and improve the test coverage of the project.
Respect and Collaboration: Treat all contributors with respect and collaborate openly.
### Questions and Discussions
If you have questions or want to discuss ideas before contributing, feel free to open a discussion in the repository's "Issues" section.

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

