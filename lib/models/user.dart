import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class User {
  //attribut
  String id;
  String telephone;
  String password;
  String id_cdc_status;
  String iban;
  String date;
  //constructeur
  User(
      {required this.id,
      required this.telephone,
      required this.password,
      required this.id_cdc_status,
      required this.iban,
      required this.date});
  static User? sessionUser;
  factory User.fromJson(Map<String, dynamic> i) => User(
        id: i['id'],
        telephone: i['telephone'],
        password: i['password'],
        id_cdc_status: i['id_cdc_status'],
        iban: i['iban'],
        date: i['date'],
      );
  Map<String, dynamic> toMap() => {
        'id': id,
        'telephone': telephone,
        'password': password,
        'id_cdc_status': id_cdc_status,
        'iban': iban,
        'date': date
      };
  static void saveUser(User user) async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var data = jsonEncode(user.toMap());
    spref.setString("userdata", data);
    spref.commit();
  }

  static void getUser() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var data = spref.getString("userdata");
    var decode = json.decode(data.toString());
    var user = User.fromJson(decode);
    sessionUser = user;
  }

  static void logOut() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    p.setString("userdata", null.toString());
    sessionUser = null;
    p.commit();
  }
}
