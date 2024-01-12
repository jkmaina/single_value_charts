import 'package:flutter/material.dart';

//
/*
ChartThemeData is typically a broader concept that encompasses all aspects of 
theming for a chart. It can include:

- Colors for various components (background, text, lines, etc.).
- Text styles for labels, values, and other textual elements.
- Border styles, including radius and width.
- Shadow definitions.
- Potentially, default settings for animations, transitions, or interactions.

The purpose of ChartThemeData is to provide a comprehensive set of theming 
options that can be applied to a chart or a set of charts. It's akin to 
ThemeData in Flutter, which defines the global thematic styles of an entire 
application.
*/

class ChartThemeData {
  final Color backgroundColor;
  final TextStyle labelStyle;
  final TextStyle valueStyle;
  final TextStyle secondaryValueStyle;
  final TextStyle unitStyle;
  final BorderRadius borderRadius;
  final BoxShadow boxShadow;

  const ChartThemeData({
    this.backgroundColor = Colors.white,
    this.labelStyle =
        const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
    this.valueStyle =
        const TextStyle(fontSize: 36, fontWeight: FontWeight.bold,),
    this.secondaryValueStyle =
        const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    this.unitStyle = const TextStyle(fontSize: 14),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.boxShadow = const BoxShadow(
      color: Colors.grey,
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  });
}
