import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// class BRLineChart extends StatefulWidget {
//   const BRLineChart({Key? key}) : super(key: key);

//   @override
//   State<LineChart> createState() => _LineChartState();
// }

// class _LineChartState extends State<LineChart> {
//   @override
//   Widget build(BuildContext context) {
//     return LineChart(
//       LineChartData(lineBarsData: [
//         LineChartBarData(
//           spots: [
//             const FlSpot(0, 10),
//             const FlSpot(0, 10),
//             const FlSpot(0, 20),
//             const FlSpot(0, 30)
//           ],
//           barWidth: 1,
//         )
//       ], backgroundColor: const Color.fromARGB(255, 0, 138, 126)),
//       swapAnimationDuration: const Duration(milliseconds: 150), // Optional
//       swapAnimationCurve: Curves.linear,
//     );
//   }
// }

class BRLineChart extends StatelessWidget {
  const BRLineChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 350,
      child: LineChart(
        LineChartData(borderData: FlBorderData(show: false), lineBarsData: [
          LineChartBarData(spots: [
            const FlSpot(0, 1),
            const FlSpot(1, 3),
            const FlSpot(2, 10),
            const FlSpot(3, 7),
            const FlSpot(4, 12),
            const FlSpot(5, 13),
            const FlSpot(6, 17),
            const FlSpot(7, 15),
            const FlSpot(8, 20)
          ])
        ]),
      ),
    );
  }
}
