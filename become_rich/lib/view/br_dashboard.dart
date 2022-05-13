import 'package:become_rich/controller/br_linechart-ctrl.dart';
import 'package:become_rich/model/br_circle_chart.dart';
import 'package:become_rich/model/br_db_interface.dart';
import 'package:become_rich/model/br_line_chart.dart';
import 'package:become_rich/view/br_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, //required this.accountData})
   }) : super(key: key);

  // final List<Map<String, int>> accountData;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //int intIndex = 5;
  Future<List<Map<String, int>>> dbGetAccountDatas = GetIt.I<DbInterface>().manageDataUserAccount();
  Future<Map<String, int>> _getAccountDatas(x) {

  }

  @override
  void initstate() {
    super.initState();
    widget.call().then((value) => null)
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// class Dashboard extends StatelessWidget {
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 24, 0, 92),
//           elevation: 0,
//           title: const Text(
//             "Dashboard",
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//           actions: [
//             Builder(
//               builder: (context) => IconButton(
//                   onPressed: () => Scaffold.of(context).openDrawer(),
//                   icon: const Icon(Icons.menu)),
//             )
//           ]),
//       drawer: const BRDrawer(),
//       body: ListView(
//         children: <Widget>[
//           const SizedBox(
//             height: 20,
//           ),
//           Card(
//             color: const Color.fromARGB(0, 255, 255, 255),
//             shadowColor: Colors.indigo[100],
//             elevation: 5,
//             child: Column(
//               children: const <Widget>[
//                 Text('Recettes', style: TextStyle(fontSize: 24)),
//                 LineChartController(),
//               ],
//             ),
//           ),
//           Card(
//             color: const Color.fromARGB(0, 255, 255, 255),
//             shadowColor: Colors.indigo[100],
//             elevation: 5,
//             child: Column(children: const <Widget>[
//               SizedBox(height: 20),
//               Text('Dépenses', style: TextStyle(fontSize: 24)),
//               BRCircleChart()
//             ]),
//           ),
//           TextButton(
//             onPressed: (() => GetIt.I<DbInterface>().getAllAccount()),
//             child: const Text('GETALLACCOUNT'),
//           ),
//           TextButton(
//             onPressed: (() => GetIt.I<DbInterface>().getAllAccountInfos()),
//             child: const Text('GETALLACCOUNTINFOS'),
//           ),
//           TextButton(
//             onPressed: (() => GetIt.I<DbInterface>().getAllEpargne()),
//             child: const Text('GETALLEPARGNE'),
//           ),
//           TextButton(
//             onPressed: (() => GetIt.I<DbInterface>().getUserAccount("celine")),
//             child: const Text('GETUSERACCOUNT'),
//           ),
//           TextButton(
//             onPressed: (() =>
//                 GetIt.I<DbInterface>().getUserAccountInfos("celine")),
//             child: const Text('GETUSERACCOUNTINFOS'),
//           ),
//           TextButton(
//             onPressed: (() => GetIt.I<DbInterface>().getUserEpargne("celine")),
//             child: const Text('GETUSEREPARGNE'),
//           ),
//           TextButton(
//             onPressed: (() => GetIt.I<DbInterface>().sumAllAccount()),
//             child: const Text('SUMALLACCOUNT'),
//           ),
//           TextButton(
//             onPressed: (() => GetIt.I<DbInterface>().manageDateUserAccount(5)),
//             child: const Text('YEARUSERACCOUNT'),
//           ),
//         ],
//       ),
//     );
//   }
// }
