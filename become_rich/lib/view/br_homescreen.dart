import 'package:become_rich/Models/Accounts/account.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.account, Key? key}) : super(key: key);
  final Account account;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('💲 BecomeRich'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                Card(),
                Card(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
