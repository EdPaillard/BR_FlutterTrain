import 'package:become_rich/Models/Accounts/account.dart';
import 'package:become_rich/Models/Depenses/depense.dart';
import 'package:become_rich/Models/Recettes/recette.dart';
import 'package:flutter/material.dart';

class DataFormat {
  Account dataToAccount(dynamic datas) {
    print(datas);
    Account account = Account.fromJson(datas);
    return account;
  }

  Recette dataToRecette(dynamic datas) {
    Recette recette = Recette.fromJson(datas);
    return recette;
  }

  Depense dataToDepense(dynamic datas) {
    Depense depense = Depense.fromJson(datas);
    return depense;
  }
}
