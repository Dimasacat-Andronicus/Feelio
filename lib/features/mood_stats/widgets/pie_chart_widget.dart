import 'package:feelio/utils/mood_enums.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MoodPieChart extends StatelessWidget {
  final Map<String, double> moodPercentages;

  const MoodPieChart({super.key, required this.moodPercentages});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 300,
      child: PieChart(
        dataMap: moodPercentages.map(
          (key, value) => MapEntry(key, value.toDouble()),
        ),
        chartRadius: 200,
        colorList:
            moodPercentages.keys
                .map((key) => Mood.values.byName(key.toLowerCase()).emojiColor)
                .toList(),
        chartType: ChartType.ring,
        chartValuesOptions: ChartValuesOptions(
          showChartValuesInPercentage: true,
          showChartValuesOutside: true,
          showChartValueBackground: false,
          decimalPlaces: 1,
          chartValueStyle: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: colorTheme.primary,
          ),
        ),
        legendOptions: LegendOptions(
          showLegends: true,
          legendTextStyle: TextStyle(fontSize: 12, color: colorTheme.primary),
          legendPosition: LegendPosition.bottom,
          showLegendsInRow: true,
        ),
      ),
    );
  }
}
