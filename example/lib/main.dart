import 'package:flutter/material.dart';
import 'gallery_screen.dart';

void main() {
  runApp(const ExampleChartGallery());
}

class ExampleChartGallery extends StatelessWidget {
  const ExampleChartGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Single Value Charts Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GalleryScreen(),
    );
  }
}
