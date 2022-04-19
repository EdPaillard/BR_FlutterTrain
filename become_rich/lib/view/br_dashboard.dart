import 'package:become_rich/model/br_circle_chart.dart';
import 'package:become_rich/model/br_line_chart.dart';
import 'package:become_rich/view/br_drawer.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 24, 0, 92),
          elevation: 0,
          title: const Text(
            "Dashboard",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(Icons.menu)),
            )
          ]),
      drawer: const BRDrawer(),
      body: Column(children: const <Widget>[
        BRLineChart(),
        BRCircleChart(),
      ]),
    );
  }
}
