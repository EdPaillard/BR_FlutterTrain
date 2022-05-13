import 'package:http/http.dart' as http;
import 'dart:convert';

class DbInterface {
  String user = "celine";
  // Comptes
  // Getter
  int getUserAccount(user) {
    var response = http.get(Uri.parse('http:/10.0.2.2:5000/api/$user/courant'));

    int courant = response as int;
    print(courant);
    return courant;
  }

  int getUserEpargne(user) {
    var response = http.get(Uri.parse('http:/10.0.2.2:5000/api/$user/epargne'));

    int epargne = response as int;
    print(epargne);
    return epargne;
  }

  Future<List<dynamic>> getAllAccount() async {
    var response =
        await http.get(Uri.parse('http://10.0.2.2:5000/api/courant/all'));

    List<dynamic> responseMap = json.decode(response.body);

    print(responseMap);
    print(responseMap[0]["courant"]);
    return responseMap;
  }

  List<int> getAllEpargne() {
    var response = http.get(Uri.parse('http:/10.0.2.2:5000/api/epargne/all'));

    List<int> epargne = response as List<int>;
    print(epargne);
    return epargne;
  }

  Future<List<dynamic>> getUserAccountInfos(user) async {
    var response = await http
        .get(Uri.parse('http://10.0.2.2:5000/api/account/$user/infos'));

    List<dynamic> userAccountInfos = json.decode(response.body);

    return userAccountInfos;
  }

  List getAllAccountInfos() {
    var response =
        http.get(Uri.parse('http:/10.0.2.2:5000/api/account/all/infos'));

    List allAccountInfos = response as List;
    print(allAccountInfos);
    return allAccountInfos;
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

  // Future<List<Map<String, int>>> yearUserAccount() async {
  //   List<dynamic> userAccountInfos = await manageDateUserAccount(12);

  //   Map<String, int> mapUserCourantInfos = {
  //     for (var element in userAccountInfos)
  //       element["atTime"].split("T")[0]: element["courant"]
  //   };
  //   Map<String, int> mapUserEpargneInfos = {
  //     for (var element in userAccountInfos)
  //       element["atTime"].split("T")[0]: element["epargne"]
  //   };

  //   List<Map<String, int>> mapUserAccount = [
  //     mapUserCourantInfos,
  //     mapUserEpargneInfos
  //   ];

  //   return mapUserAccount;
  // }

  // Future<List<Map<String, int>>> sixMonthUserAccount() async {
  //   List<dynamic> userAccountInfos = await manageDateUserAccount(6);

  //   Map<String, int> mapUserCourantInfos = {
  //     for (var element in userAccountInfos)
  //       element["atTime"].split("T")[0]: element["courant"]
  //   };
  //   Map<String, int> mapUserEpargneInfos = {
  //     for (var element in userAccountInfos)
  //       element["atTime"].split("T")[0]: element["epargne"]
  //   };

  //   List<Map<String, int>> mapUserAccount = [
  //     mapUserCourantInfos,
  //     mapUserEpargneInfos
  //   ];

  //   return mapUserAccount;
  // }

  // Future<List<Map<String, int>>> threeMonthUserAccount() async {
  //   List<dynamic> userAccountInfos = await manageDateUserAccount(3);

  //   Map<String, int> mapUserCourantInfos = {
  //     for (var element in userAccountInfos)
  //       element["atTime"].split("T")[0]: element["courant"]
  //   };
  //   Map<String, int> mapUserEpargneInfos = {
  //     for (var element in userAccountInfos)
  //       element["atTime"].split("T")[0]: element["epargne"]
  //   };

  //   List<Map<String, int>> mapUserAccount = [
  //     mapUserCourantInfos,
  //     mapUserEpargneInfos
  //   ];

  //   return mapUserAccount;
  // }

  // Future<List<Map<String, int>>> oneMonthUserAccount() async {
  //   List<dynamic> userAccountInfos = await manageDateUserAccount(1);

  //   Map<String, int> mapUserCourantInfos = {
  //     for (var element in userAccountInfos)
  //       element["atTime"].split("T")[0]: element["courant"]
  //   };
  //   Map<String, int> mapUserEpargneInfos = {
  //     for (var element in userAccountInfos)
  //       element["atTime"].split("T")[0]: element["epargne"]
  //   };

  //   List<Map<String, int>> mapUserAccount = [
  //     mapUserCourantInfos,
  //     mapUserEpargneInfos
  //   ];

  //   return mapUserAccount;
  // }

  Future<List<Map<String, int>>> manageDataUserAccount(x) async {
    List<dynamic> userAccountInfos = await getUserAccountInfos(user);

    int dateVariable = x;
    var now = DateTime.now().toUtc();
    var borderDate =
        DateTime(now.year, now.month - dateVariable, now.day).toUtc();
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

    for (int i = 0; i < arrayIndexes.length; i++) {
      userAccountInfos.removeAt(arrayIndexes[i]);
    }

    Map<String, int> mapUserCourantInfos = {
      for (var element in userAccountInfos)
        element["atTime"].split("T")[0]: element["courant"]
    };
    Map<String, int> mapUserEpargneInfos = {
      for (var element in userAccountInfos)
        element["atTime"].split("T")[0]: element["epargne"]
    };

    List<Map<String, int>> mapUserAccount = [
      mapUserCourantInfos,
      mapUserEpargneInfos
    ];

    print(mapUserAccount);

    return mapUserAccount;
  }

  // Dépenses

  // Recettes
}
