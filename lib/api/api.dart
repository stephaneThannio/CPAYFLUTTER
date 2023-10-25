import 'dart:async';
import 'dart:convert';

import 'package:cpay/models/user.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

//test

class Api {
  //send code
  static send3dcode(String montant) async {
    try {
      final request = await post(Uri.parse("https://api.c-pay.me"),
          body: jsonEncode({
            "app": "cpay",
            "iban": User.sessionUser!.iban,
            "montant": montant,
            "Autorization": "...",
            "action": "send_3d_secure"
          }),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          }).timeout(const Duration(seconds: 20));

      if (request.statusCode == 200) {
        var data = jsonDecode(request.body);
        return data;
      } else {
        return {};
      }
    } catch (e) {
      return e;
    }
  }

//=======================================
//Virement===============================
  static sendMoney(
    String ibandest,
    String montant,
    String code,
    String virmenttype,
    String id_periodicity,
    String datefin,
    String motif,
  ) async {
    try {
      final request = await post(Uri.parse("https://api.c-pay.me"),
          body: jsonEncode({
            "app": "cpay",
            "Autorization": "...",
            "action": "virement",
            "iban": User.sessionUser!.iban,
            "IBAN1": ibandest,
            "montant": montant,
            "id_cpay_type_virement": virmenttype,
            "id_cpay_periodicite": id_periodicity,
            "code": code,
            "du": DateFormat('yy-MM-dd').format(DateTime.now()),
            "au": datefin,
            "motif": motif
          }),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          }).timeout(const Duration(seconds: 20));

      if (request.statusCode == 200) {
        var data = jsonDecode(request.body);
        return data;
      } else {
        return {};
      }
    } catch (e) {
      return e;
    }
  }

//=======================================
//Demande de retrait
  static sendretirer(String montant, String code) async {
    try {
      final request = await post(Uri.parse("https://api.c-pay.me"),
          body: jsonEncode({
            "app": "cpay",
            "iban": User.sessionUser!.iban,
            "Autorization": "...",
            "montant": montant,
            "code": code,
            "action": "retrait"
          }),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          }).timeout(const Duration(seconds: 20));

      if (request.statusCode == 200) {
        var data = jsonDecode(request.body);
        return data;
      } else {
        return {};
      }
    } catch (e) {
      return e;
    }
  }

//==========================================
//categorie rehcerche
  static getcategories() async {
    try {
      final request = await post(Uri.parse("https://api.c-pay.me"),
          body: jsonEncode({
            "app": "cpay",
            "Autorization": "...",
            "action": "get_vente_categorie"
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }).timeout(const Duration(seconds: 20));
      if (request.statusCode == 200) {
        var data = jsonDecode(request.body);
        return data;
      } else {
        return {};
      }
    } catch (e) {
      return e;
    }
  }

//=======================================================
//Recherche par categories article
  static getarticlebycategories(String cat, int page, String textsearch) async {
    final request = await post(Uri.parse("https://api.c-pay.me"),
        body: jsonEncode({
          "app": "cpay",
          "Autorization": "...",
          "action": "get_vente",
          "page": page,
          "categorie": cat,
          "search": textsearch
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }).timeout(const Duration(seconds: 15));
    if (request.statusCode == 200) {
      var data = jsonDecode(request.body);
      return data;
    } else {
      return 0;
    }
  }

//========================================================
//afficher article
  static getarticle(int page) async {
    //List listarticle = [];
    try {
      final request = await post(Uri.parse("https://api.c-pay.me"),
          body: jsonEncode({
            "app": "cpay",
            "Autorization": "...",
            "action": "get_vente",
            "page": page
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }).timeout(const Duration(seconds: 20));
      if (request.statusCode == 200) {
        var data = jsonDecode(request.body);
        //listarticle = data["mdata"];
        return data;
      } else {
        return 0;
      }
    } catch (e) {
      return e;
    }
  }

//=====================================================
//deposer de l'argent mvola======================
  static faireDepotMvola(String iban, String montant, String phone) async {
    final request = await post(Uri.parse('https://api.c-pay.me'),
        body: jsonEncode({
          "app": "cpay",
          "iban": iban,
          "montant": montant,
          "telephone": phone,
          "Autorization": "...",
          "action": "depot_mvola"
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }).timeout(const Duration(seconds: 20));
    if (request.statusCode == 200) {
      var data = jsonDecode(request.body);
      return data;
    }
  }

//===============================================================
//ecouter la statu api mvola=========
  static listenStatus(String servercorrelationid) async {
    final request =
        await get(Uri.parse("https://api.c-pay.me/mvola/$servercorrelationid"));
    if (request.statusCode == 200) {
      var data = jsonDecode(request.body);
      return data;
    } else {
      return 0;
    }
  }

//=====================
//
  static getDepotlist(String iban, int page) async {
    final request = await post(Uri.parse('https://api.c-pay.me/depot'),
        body: jsonEncode({
          "app": "cpay",
          "session": iban,
          "Autorization": "...",
          "action": "get_transactions",
          "page": page
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (request.statusCode == 200) {
      var data = jsonDecode(request.body);
      return data;
    } else {
      return 0;
    }
  }

  static getReference(String iban, String montant) async {
    try {
      var request = await post(Uri.parse('https://api.c-pay.me/depot'),
          body: jsonEncode({
            "app": "cpay",
            "iban": iban,
            "Autorization": "...",
            "action": "get_reference",
            "montant": montant
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      if (request.statusCode == 200) {
        // Map<String, dynamic> data =
        //     Map<String, dynamic>.from(jsonDecode(request.body));
        var data = jsonDecode(request.body);
        return data;
      } else {
        return null;
      }
    } catch (erreur) {
      return 0;
    }
  }

  static sendrequestdepositBnktransfer(
      String iban, String montant, String ref) async {
    try {
      var request = await post(Uri.parse('https://api.c-pay.me/depot'),
          body: jsonEncode({
            "app": "cpay",
            "iban": iban,
            "Autorization": "...",
            "action": "depot_bank",
            "montant": montant,
            "reference": ref
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      if (request.statusCode == 200) {
        // Map<String, dynamic> data =
        //     Map<String, dynamic>.from(jsonDecode(request.body));
        var data = jsonDecode(request.body);
        return data;
      } else {
        return 0;
      }
    } catch (erreur) {
      return erreur;
    }
  }
}
