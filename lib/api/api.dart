import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

//test
class Api {
  static getarticle() async {
    List listarticle = [];
    try {
      final request = await post(Uri.parse("https://api.c-pay.me"),
          body: jsonEncode({
            "app": "cpay",
            "Autorization": "...",
            "action": "get_vente",
            "page": "1"
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          }).timeout(const Duration(seconds: 20));
      if (request.statusCode == 200) {
        var data = jsonDecode(request.body);
        listarticle = data["mdata"];
        return listarticle;
      } else {
        print('no response');
      }
    } catch (e) {
      print(e);
    }
  }

  static faireDepotMvola(String iban, String montant, String phone) async {
    try {
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
      } else {
        print("request not found");
      }
    } catch (erreur) {
      if (erreur is TimeoutException) {
        Map<String, String> norm = ({"status": "timeOut"});
        return norm;
      }
    }
  }

  static listenStatus(String servercorrelationid) async {
    final request =
        await get(Uri.parse("https://api.c-pay.me/mvola/$servercorrelationid"));
    if (request.statusCode == 200) {
      var data = jsonDecode(request.body);
      return data;
    } else {
      print("error");
    }
  }

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
      return null;
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
      print(erreur);
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
        return null;
      }
    } catch (erreur) {
      print(erreur);
    }
  }
}
