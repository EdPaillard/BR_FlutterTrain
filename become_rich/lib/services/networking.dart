import 'package:become_rich/Models/User/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// const apiRoute = 'http://162.19.66.30:5500/api';
const apiRoute = 'http://192.168.1.19:5500/api';

class DbInterface {
  // Comptes
  // Getter
  Future<List<int>> getUserAccount(int userID) async {
    List<int> userCourant = [];
    http.Response response =
        await http.get(Uri.parse('$apiRoute/$userID/courant'));

    var decodedData = jsonDecode(response.body);
    for (var element in decodedData) {
      userCourant.add(element['courant']);
    }
    //print(userCourant);
    return userCourant;
  }

  Future getUserEpargne(int userID) async {
    List<int> userEpargne = [];
    http.Response response =
        await http.get(Uri.parse('$apiRoute/$userID/epargne'));

    var decodedData = jsonDecode(response.body);
    for (var element in decodedData) {
      userEpargne.add(element['epargne']);
    }

    //print(userEpargne);
    return userEpargne;
  }

  Future getAllAccount() async {
    List<int> allCourant = [];
    http.Response response = await http.get(Uri.parse('$apiRoute/courant/all'));

    var decodedData = jsonDecode(response.body);
    for (var element in decodedData) {
      allCourant.add(element['courant']);
    }
    //print(allCourant);
    return allCourant;
  }

  Future getAllEpargne() async {
    List<int> allEpargne = [];
    http.Response response = await http.get(Uri.parse('$apiRoute/epargne/all'));

    var decodedData = jsonDecode(response.body);
    for (var element in decodedData) {
      allEpargne.add(element['epargne']);
    }

    //print(allEpargne);
    return allEpargne;
  }

  Future getUserAccountInfos(int userID) async {
    List<Map<String, dynamic>> userAccountMap = [];
    http.Response response =
        await http.get(Uri.parse('$apiRoute/account/$userID/infos'));

    var decodedData = jsonDecode(response.body);
    userAccountMap = mapFormat(decodedData);
    print('userAccountInfo $userAccountMap');
    return userAccountMap;
  }

  Future getAllAccountInfos() async {
    http.Response response =
        await http.get(Uri.parse('$apiRoute/account/info/all'));

    var decodedData = jsonDecode(response.body);
    print('AllAccountInfo $decodedData');
    return jsonDecode(response.body);
  }
  // Poster

  // Logic
  Future<num> sumAllAccount() async {
    List<dynamic> allAccount = await getAllAccount();
    num sumAccount = 0;
    for (var i = 0; i < allAccount.length; i++) {
      sumAccount += allAccount[i]["courant"];
    }
    print(sumAccount);
    return sumAccount;
  }

  List<Map<String, dynamic>> mapFormat(var rawData) {
    List<String> dateArray = [];
    List<int> valuesCourantArray = [];
    List<int> valuesEpargneArray = [];
    Map<String, List<String>> dateAccounts = {'Date': dateArray};
    Map<String, List<int>> valuesCourant = {'Courant': valuesCourantArray};
    Map<String, List<int>> valuesEpargne = {'Epargne': valuesEpargneArray};

    for (var element in rawData) {
      dateArray.add(element["atTime"].split("T")[0]);
      valuesCourantArray.add(element['courant']);
      valuesEpargneArray.add(element['epargne']);
    }

    List<Map<String, dynamic>> mapUserAccount = [
      dateAccounts,
      valuesCourant,
      valuesEpargne
    ];

    return mapUserAccount;
  }

  Future<List<Map<String, dynamic>>> manageDataUserAccount(int userID) async {
    List<dynamic> userAccountInfos = await getUserAccountInfos(userID);

    int dateVariable = 0;
    var now = DateTime.now().toUtc();
    var borderDate = DateTime(now.year, now.month, now.day).toUtc();
    // - dateVariable
    List<int> reverseArrayIndexes = [];

    for (int i = 0; i < userAccountInfos.length; i++) {
      String year = userAccountInfos[i]["atTime"].split("T")[0].split("-")[0];
      String month = userAccountInfos[i]["atTime"].split("T")[0].split("-")[1];
      String day = userAccountInfos[i]["atTime"].split("T")[0].split("-")[2];
      int intYear = int.parse(year);
      int intMonth = int.parse(month);
      int intDay = int.parse(day);
      var accountDate = DateTime.utc(intYear, intMonth, intDay);

      if (accountDate.isBefore(borderDate)) {
        reverseArrayIndexes.add(i);
      }
    }

    List<int> arrayIndexes = List.from(reverseArrayIndexes.reversed);

    if (dateVariable != 0) {
      for (int i = 0; i < arrayIndexes.length; i++) {
        userAccountInfos.removeAt(arrayIndexes[i]);
      }
    }

    // Map<String, int> mapUserCourantInfos = {
    //   for (var element in userAccountInfos)
    //     element["atTime"].split("T")[0]: element["courant"]
    // };
    // Map<String, int> mapUserEpargneInfos = {
    //   for (var element in userAccountInfos)
    //     element["atTime"].split("T")[0]: element["epargne"]
    // };

    List<String> dateArray = [];
    List<int> valuesCourantArray = [];
    List<int> valuesEpargneArray = [];
    Map<String, List<String>> dateAccounts = {'Date': dateArray};
    Map<String, List<int>> valuesCourant = {'Courant': valuesCourantArray};
    Map<String, List<int>> valuesEpargne = {'Epargne': valuesEpargneArray};

    for (var element in userAccountInfos) {
      dateArray.add(element["atTime"].split("T")[0]);
      valuesCourantArray.add(element['courant']);
      valuesEpargneArray.add(element['epargne']);
    }

    List<Map<String, dynamic>> mapUserAccount = [
      dateAccounts,
      valuesCourant,
      valuesEpargne
    ];

    print(mapUserAccount);

    return mapUserAccount;
  }

  // Dépenses
  Future<dynamic> userDepense(int userID) async {
    http.Response response = await http.get(
      Uri.parse('$apiRoute/$userID/depense'),
    );

    dynamic decodedData = jsonDecode(response.body);
    return decodedData;
  }

  // Recettes
  Future<dynamic> userRecette(int userID) async {
    http.Response response = await http.get(
      Uri.parse('$apiRoute/$userID/recette'),
    );

    dynamic decodedData = jsonDecode(response.body);
    return decodedData;
  }

  // Login/Register
  Future<dynamic> userRegister(dynamic body) async {
    http.Response response =
        await http.post(Uri.parse('$apiRoute/register'), body: body);

    User decodedData = jsonDecode(response.body);
    return decodedData;
  }

  Future<Map<String, dynamic>> userLogin(dynamic body) async {
    http.Response response =
        await http.post(Uri.parse('$apiRoute/login'), body: body);

    if (response.statusCode != 200) {
      print(response.body);
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      var decodedData = jsonDecode(response.body);
      print(decodedData);
      return decodedData;
    }
  }
}
