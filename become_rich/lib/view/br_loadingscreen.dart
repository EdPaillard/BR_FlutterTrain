// import 'package:become_rich/services/networking.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'br_dashboard.dart';

// class LoadingScreen extends StatefulWidget {
//   const LoadingScreen({Key? key}) : super(key: key);

//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends State<LoadingScreen> {
//   DbInterface dbInterface = DbInterface();
//   @override
//   void initState() {
//     super.initState();
//   }

//   void getManagedAccountInfos() async {
//     var managedUserAccountInfos = await dbInterface.manageDataUserAccount();

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: ((context) => Dashboard(
//               managedUserAccountInfos: managedUserAccountInfos,
//             )),
//       ),
//     );
//   }

//   void getUserAccountInfos() async {}

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//         body: Center(
//       child: SpinKitDoubleBounce(
//         color: Colors.white,
//         size: 100.0,
//       ),
//     ));
//   }
// }
