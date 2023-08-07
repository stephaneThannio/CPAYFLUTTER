import 'dart:convert';

import 'package:http/http.dart';

//test
class Api {
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
        });
    if (request.statusCode == 200) {
      var data = jsonDecode(request.body);
      return data;
    } else {
      print("request not found");
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
}
