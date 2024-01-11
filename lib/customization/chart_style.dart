import 'package:flutter/material.dart';

/*
ChartStyle
ChartStyle, refers to specific styling of particular aspects or components of a 
chart. 

For instance:

- Style for a particular element (like a bar in a bar chart or a point in a 
line chart).
- Specific properties like fill color, stroke color, stroke width, etc.
- Styles that might be specific to a particular type of chart.

ChartStyle might be used within the context of ChartThemeData as one of 
its properties, defining the style for specific chart elements.

*/

class ChartStyle {
  final Color backgroundColor;
  final TextStyle labelStyle;
  final TextStyle valueStyle;

  ChartStyle(
      {required this.backgroundColor,
      required this.labelStyle,
      required this.valueStyle});

  // You can add more style options as needed
}
