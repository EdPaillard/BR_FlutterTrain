import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// class BRCircleChart extends StatefulWidget {
//   const BRCircleChart({Key? key}) : super(key: key);

//   @override
//   State<BRCircleChart> createState() => _BRCircleChartState();
// }

// class _BRCircleChartState extends State<BRCircleChart> {
//   @override
//   Widget build(BuildContext context) {
//     return PieChart(
//       PieChartData(sections: [
//         PieChartSectionData(
//             value: 10, color: const Color.fromARGB(255, 52, 201, 57)),
//         PieChartSectionData(
//             value: 30, color: const Color.fromARGB(255, 175, 76, 76)),
//         PieChartSectionData(
//             value: 40, color: const Color.fromARGB(255, 76, 83, 175)),
//         PieChartSectionData(
//             value: 20, color: const Color.fromARGB(255, 194, 206, 31))
//       ]),
//       swapAnimationDuration: const Duration(milliseconds: 150),
//       swapAnimationCurve: Curves.linear,
//     );
//   }
// }

class BRCircleChart extends StatelessWidget {
  const BRCircleChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 300,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 1,
          borderData: FlBorderData(show: false),
          sections: [
            PieChartSectionData(value: 10, color: Colors.purple, radius: 100),
            PieChartSectionData(value: 20, color: Colors.amber, radius: 100),
            PieChartSectionData(value: 30, color: Colors.green, radius: 100)
          ],
        ),
      ),
    );
  }
}
