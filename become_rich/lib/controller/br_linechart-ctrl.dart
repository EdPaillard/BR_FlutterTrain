import 'package:become_rich/model/br_db_interface.dart';
import 'package:become_rich/model/br_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LineChartController extends StatefulWidget {
  const LineChartController({Key? key}) : super(key: key);

  @override
  State<LineChartController> createState() => _LineChartControllerState();
}

class _LineChartControllerState extends State<LineChartController> {
  DbInterface dbInterface = GetIt.I<DbInterface>();
  late List<Map<String, int>> accountsInfos;

  @override
  void initState() {
    super.initState();
    dbInterface.manageDateUserAccount(12).then((value) {
      accountsInfos = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BRLineChart(accountInfos: accountsInfos);
  }
}
