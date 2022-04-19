import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'controller/br_dash_ctrl.dart';
import 'controller/br_manage_ctrl.dart';
import 'controller/br_settings_ctrl.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/dashboard",
      onGenerateRoute: (settings) {
        Map routes = {
          '/dashboard': () => const DashboardController(),
          '/budget': () => const BudgetController(),
          '/settings': () => const OptionsController(),
        };
        if (settings.name == Navigator.defaultRouteName) {
          return null;
        }
        return PageRouteBuilder(
            settings:
                settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
            pageBuilder: (_, __, ___) => routes[settings.name].call(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                      position: animation.drive(
                          Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                              .chain(CurveTween(curve: Curves.ease))),
                      child: child,
                    ));
      },
    );
  }
}
