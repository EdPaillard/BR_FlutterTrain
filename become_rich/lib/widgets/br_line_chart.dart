import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BRLineChart extends StatelessWidget {
  BRLineChart({required this.managedUserAccountInfos, Key? key})
      : super(key: key);
  List<Map<String, dynamic>> managedUserAccountInfos;

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('JAN', style: style);
        break;
      case 1:
        text = const Text('FEV', style: style);
        break;
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 3:
        text = const Text('AVR', style: style);
        break;
      case 4:
        text = const Text('MAI', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
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
      case 0:
        text = '0';
        break;
      case 500:
        text = '500';
        break;
      case 1000:
        text = '1000';
        break;
      case 1500:
        text = '1500';
        break;
      case 2000:
        text = '2000';
        break;
      case 2500:
        text = '2500';
        break;
      case 3000:
        text = '3000';
        break;
      case 3500:
        text = '3500';
        break;
      case 4000:
        text = '4000';
        break;
      case 4500:
        text = '4500';
        break;
      case 5000:
        text = '5000';
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
                reservedSize: 50,
                interval: 1,
                getTitlesWidget: bottomTitleWidgets,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 500,
                getTitlesWidget: leftTitleWidgets,
                reservedSize: 42,
              ),
            ),
          ),
          minX: 0,
          maxX: 5,
          minY: 0,
          maxY: 5000,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(
                    0.9, managedUserAccountInfos[1]['Courant'][0].toDouble()),
                FlSpot(((28 * 3.3) / 100) + 1,
                    managedUserAccountInfos[1]['Courant'][1].toDouble()),
                FlSpot(2, managedUserAccountInfos[1]['Courant'][2].toDouble()),
                FlSpot(3, managedUserAccountInfos[1]['Courant'][3].toDouble()),
              ],
            ),
            LineChartBarData(
              spots: [
                FlSpot(0, managedUserAccountInfos[2]['Epargne'][0].toDouble()),
                FlSpot(1, managedUserAccountInfos[2]['Epargne'][1].toDouble()),
                FlSpot(1, managedUserAccountInfos[2]['Epargne'][2].toDouble()),
                FlSpot(1, managedUserAccountInfos[2]['Epargne'][3].toDouble()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
