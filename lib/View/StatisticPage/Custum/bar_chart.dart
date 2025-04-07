import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticBarChart extends StatelessWidget {
  const StatisticBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> data = [
      ChartData('Jan', 30),
      ChartData('Feb', 42),
      ChartData('Mar', 54),
      ChartData('Apr', 20),
    ];
    return SizedBox(
      child: SfCartesianChart(
        title: const ChartTitle(text: 'res'),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: [
          ColumnSeries<ChartData, String>(
              dataSource: data,
              xValueMapper: (ChartData sales, _) => sales.month,
              yValueMapper: (ChartData sales, _) => sales.value)
        ],
      ),
    );
  }
}

class ChartData {
  final String month;
  final double value;

  ChartData(this.month, this.value);
}
