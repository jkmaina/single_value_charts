import 'package:flutter/material.dart';
import 'package:single_value_charts/single_value_charts.dart'; // Import your chart library

class SpecializedChartsDemo extends StatelessWidget {
  const SpecializedChartsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of specialized chart widgets
    List<Widget> charts = [
     AuctionPriceChart(currentBid: 12000, label: 'Auction Price Chart').buildChart(),
            CountdownTimerChart(timeRemaining: const Duration(hours: 4, minutes: 30), label: 'Countdown Timer Chart').buildChart(),
            EnergyConsumptionChart(consumption: 3500, period: 'Days', label: 'EnergyConsumptionChart').buildChart(),
            EventCountdownChart(timeUntilEvent: const Duration(days: 14), label: 'Event Count downChart').buildChart(),
            HumidityIndicatorChart(humidityPercentage: 45, label: 'Humidity Indicator Chart').buildChart(),
            IncidentReportsChart(incidentCount: 2, label: 'Incident Reports Chart').buildChart(),
            NetworkSignalChart(signalStrength: 4, label: 'Network Signal Chart').buildChart(),
            PopulationCountChart(malePopulation: 2000000, femalePopulation: 2500000, label: 'Population Count Chart').buildChart(),
            SocialMediaReachChart(followersCount: 24000, platform: "Instagram", label: 'Social Media Chart').buildChart(),
            StorageSpaceChart(usedStorage: 60, totalStorage: 100, label: 'Storage Space Chart').buildChart(),
            TemperatureGaugeChart(temperature: 72, minTemp: 0, maxTemp: 100, label: 'Temperature Gauge Chart').buildChart(),
            UsageMeterChart(currentUsage: 70, maxUsage: 100,label: 'Usage Meter Chart').buildChart(),
            WaterQualityChart(purityIndex: 92, label: 'Water Quality Chart').buildChart(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Specialized Charts Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300, // Maximum item width
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2, // Adjust the aspect ratio as needed
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
