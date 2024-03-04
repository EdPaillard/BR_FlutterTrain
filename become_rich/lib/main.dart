import 'package:become_rich/view/br_loginscreen.dart';
import 'package:flutter/material.dart';
import 'view/br_dashboard.dart';
import 'view/br_loadingscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Become Rich',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/login",
      routes: {
        '/login': (context) => LoginScreen(),
        // '/loading': (context) => const LoadingScreen(),
        '/dashboard': (context) => Dashboard(managedUserAccountInfos: const []),
        // '/budget': (context) => const BudgetController(),
        // '/settings': (context) => const OptionsController(),
      },
    );
  }
}
