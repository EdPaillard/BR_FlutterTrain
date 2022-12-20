import 'package:become_rich/widgets/br_line_chart.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({required this.managedUserAccountInfos, Key? key})
      : super(key: key);
  List<Map<String, dynamic>> managedUserAccountInfos;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BRLineChart(
          managedUserAccountInfos: widget.managedUserAccountInfos,
        ),
      ),
    );
  }
}
