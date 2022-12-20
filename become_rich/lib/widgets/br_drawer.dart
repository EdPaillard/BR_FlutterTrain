import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final IconData icon;

  final String title;

  final String route;

  final void Function()? callback;

  const DrawerButton(
      {Key? key,
      required this.icon,
      required this.title,
      required this.route,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentRoute = "";

    currentRoute = ModalRoute.of(context)!.settings.name!;
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: callback ??
          () {
            if (currentRoute == route) {
              Navigator.pop(context);
            } else {
              Navigator.pushNamed(context, route);
            }
          },
    );
  }
}

class BRDrawer extends StatelessWidget {
  const BRDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      SizedBox(
        height: 200.0,
        child: DrawerHeader(
          child: Column(children: [
            SizedBox(
              height: 100,
              child: Image.asset('assets/celine.jpg', height: 80, width: 80),
            ),
            const Text("Céline", style: TextStyle(fontSize: 20))
          ]),
        ),
      ),
      const DrawerButton(
          icon: Icons.dashboard, title: "Dashboard", route: "/dashboard"),
      const DrawerButton(
          icon: Icons.euro, title: "Gestion du budget", route: "/budget"),
      const DrawerButton(
          icon: Icons.settings, title: "Options", route: "/settings"),
    ]));
  }
}
