import 'package:become_rich/view/br_dashboard.dart';
import 'package:flutter/material.dart';

class DashboardController extends StatefulWidget {
  const DashboardController({Key? key}) : super(key: key);

  @override
  State<DashboardController> createState() => _DashboardControllerState();
}

class _DashboardControllerState extends State<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return const Dashboard();
  }
}
