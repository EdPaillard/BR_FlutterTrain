import 'package:become_rich/model/br_db_interface.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
  BRLineChart({Key? key, required this.accountInfos}) : super(key: key);

  List<Map<String, int>> accountInfos;

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('MAR', style: style);
        break;
      case 2:
        text = const Text('JUN', style: style);
        break;
      case 3:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return Padding(child: text, padding: const EdgeInsets.only(top: 8.0));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      case 7:
        text = '50k';
        break;
      case 9:
        text = '50k';
        break;
      case 11:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 350,
      child: LineChart(
        LineChartData(
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d), width: 1),
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: leftTitleWidgets,
                  reservedSize: 42,
                ),
              ),
            ),
            minX: 0,
            maxX: 12,
            minY: 0,
            maxY: 8,
            lineBarsData: [
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
