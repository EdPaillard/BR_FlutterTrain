import 'package:become_rich/Models/Accounts/account.dart';
import 'package:become_rich/Models/Depenses/depense.dart';
import 'package:become_rich/Models/Recettes/recette.dart';
import 'package:become_rich/Models/User/user.dart';
import 'package:become_rich/Utilities/constants.dart';
import 'package:become_rich/services/data_format.dart';
import 'package:become_rich/services/networking.dart';
import 'package:become_rich/view/br_homescreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  DbInterface dbInterface = DbInterface();
  DataFormat dataFormat = DataFormat();
  late Account account;
  late Recette recette;
  late Depense depense;
  late User user;

  Future<bool> setUserInfos() async {
    bool login = await userLogin();
    if (!login) return false;
    bool checkAccount = await getUserAccounts();
    if (!checkAccount) return false;
    bool checkRecette = await getUserRecette();
    if (!checkRecette) return false;
    bool checkDepense = await getUserDepense();
    if (!checkDepense) return false;

    return true;
  }

  Future<bool> userLogin() async {
    Map body = {
      "email": nameController.text,
      "password": passwordController.text
    };
    Map<String, dynamic> data = await dbInterface.userLogin(body);
    if (data.containsKey('Forbidden')) {
      return false;
    } else {
      user = User.fromJson(data);
      return true;
    }
  }

  Future<bool> getUserAccounts() async {
    dynamic userAccount = await dbInterface.getUserAccountInfos(user.id);
    if (!userAccount) return false;
    dataFormat.dataToAccount(userAccount);
    return true;
  }

  Future<bool> getUserRecette() async {
    dynamic userRecette = await dbInterface.userRecette(user.id);
    if (!userRecette) return false;
    dataFormat.dataToRecette(userRecette);
    return true;
  }

  Future<bool> getUserDepense() async {
    dynamic userDepense = await dbInterface.userDepense(user.id);
    if (!userDepense) return false;
    dataFormat.dataToDepense(userDepense);
    return true;
  }

  // Future<bool> checkLoginScreen() async {
  //   APIManager apiManager = APIManager();
  //   var data = await apiManager.LoginScreen(
  //       nameController.text, passwordController.text);

  //   if (data.containsKey("Success")) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // Future<bool> register() async {
  //   APIManager apiManager = APIManager();
  //   var data =
  //       await apiManager.register(nameController.text, passwordController.text);

  //   if (data.containsKey("Success")) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Image.asset(
            'assets/becomerich_logo.png',
            width: 250,
            height: 250,
          ),
          const SizedBox(height: 100),
          TextFormField(
            style: const TextStyle(fontSize: 20.0, color: mainColor),
            decoration: const InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(fontSize: 20.0, color: mainColor),
              fillColor: highlightColor,
              filled: true,
              labelStyle: TextStyle(color: mainColor, fontSize: 16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
                borderSide: BorderSide(
                  color: highlightColor,
                  width: 1.0,
                ),
              ),
            ),
            controller: nameController,
          ),
          const SizedBox(height: 8),
          TextFormField(
            obscureText: true,
            style: const TextStyle(fontSize: 20.0, color: mainColor),
            decoration: const InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(fontSize: 20.0, color: mainColor),
              fillColor: highlightColor,
              filled: true,
              labelStyle: TextStyle(color: mainColor, fontSize: 16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
                borderSide: BorderSide(
                  color: mainColor,
                  width: 1.0,
                ),
              ),
            ),
            controller: passwordController,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: mainColor,
            ),
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () async {
              print('login');
              bool isLogged = await setUserInfos();
              print(user.email);
              if (isLogged) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                            account: account,
                          )),
                );
              } else {
                Fluttertoast.showToast(
                  msg: "Wrong credentials",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: const Color.fromRGBO(217, 202, 184, 1),
                  textColor: Colors.red,
                  fontSize: 16.0,
                );
              }
            },
          ),
          const SizedBox(height: 10),
          TextButton(
            child: const Text(
              "Register",
              style: TextStyle(color: mainColor),
            ),
            onPressed: () async {
              print('register');
              // bool registration = await register();
              // if (!registration) {
              //   Fluttertoast.showToast(
              //     msg: "Oops, something went wrong...",
              //     toastLength: Toast.LENGTH_SHORT,
              //     gravity: ToastGravity.CENTER,
              //     timeInSecForIosWeb: 1,
              //     backgroundColor: const Color.fromRGBO(217, 202, 184, 1),
              //     textColor: const Color.fromRGBO(163, 166, 70, 1),
              //     fontSize: 16.0,
              //   );
              // }
            },
          ),
        ],
      ),
    );
  }
}
