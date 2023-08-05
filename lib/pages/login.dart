//import 'package:cpay/pages/myAccount/myAccunt.dart';
// ignore_for_file: avoid_print, duplicate_ignore

import 'dart:convert';
import 'package:cpay/items/loading.dart';
import 'package:cpay/models/user.dart';
import 'package:cpay/pages/Accueil.dart';
import 'package:cpay/pages/confirmation.dart';
import 'package:quickalert/quickalert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../items/TextFieldPreuse.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController uName = TextEditingController();
  TextEditingController pWD = TextEditingController();
  String tel = "";
  String password = "";
  bool loading = false;
  Duration dur = const Duration(days: 365);

  void alert(String titreAlert, String textAlert, QuickAlertType typeAlert,
      VoidCallback func) {
    QuickAlert.show(
      context: context,
      type: typeAlert,
      title: titreAlert,
      text: textAlert,
      onConfirmBtnTap: func,
      confirmBtnColor: const Color(0xFF6334A9),
    );
  }

  void welcome() {
    User.getUser();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Accueil()));
  }

  void notWelcome() {
    Navigator.pop(context);
  }

  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  Future sendLoginRequest() async {
    tel = uName.text;
    password = pWD.text;
    if (tel == '' && password == '') {
      alert('Erreur', 'veillez remplir le champ', QuickAlertType.error,
          notWelcome);
    } else {
      setState(() {
        loading = true;
      });
      //AlertLoad();
      final request = await post(Uri.parse('https://api.c-pay.me'),
          body: jsonEncode({
            "app": "cpay",
            "login": tel,
            "password": password,
            "Autorization": "...",
            "action": "authentification"
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      // ignore: duplicate_ignore
      if (request.statusCode == 200) {
        var data = jsonDecode(request.body);
        if (data["status"] == 'logged_in') {
          setState(() {
            loading = false;
            User.saveUser(User.fromJson(jsonDecode(data["mdata"])));
            print(data);
          });
          alert("bienvenue", 'Vous etes maintenant connecter a cpay',
              QuickAlertType.success, welcome);
        } else if (data["status"] == 'error') {
          setState(() {
            loading = false;
          });
          alert("Error", data['mdata'].toString(), QuickAlertType.error,
              notWelcome);
        } else if (data["status"] == 'warning') {
          setState(() {
            loading = false;
          });
          alert("Attention", data['mdata'].toString(), QuickAlertType.warning,
              () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Confirmation(phone: tel, pwd: password)));
          });
        }
        // print(data["status"]);
        // ignore: avoid_print
        print(data);
      } else {
        print('request not send');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //la photo de logo cpay==========================================================
        Align(
          alignment: const Alignment(0, -0.7),
          child: SizedBox(
            width: 200,
            height: 200,
            child: Center(
              child: Image.asset(('lib/photos/285-min.png')),
            ),
          ),
        ),
        //l'ombre======================================================
        Align(
          alignment: const Alignment(0.04, -0.29),
          child: Container(
            decoration: BoxDecoration(
              //color: Colors.black.withOpacity(0.1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 4),
                  blurRadius: 20,
                ),
              ],
            ),
            width: 120,
            height: 30,
          ),
        ),
        loading
            ? const Loading(
                containcouleur: Color(0xFF6334A9),
                spincouleur: Colors.white,
              )
            : Align(
                alignment: const Alignment(0, 0.9),
                child: SizedBox(
                  //container qui englobe les formulaire==========================================
                  //color: Colors.yellow,
                  height: 440,
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        //color: Colors.red,
                        width: 300,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Authentification',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFieldPreuse(
                        control: uName,
                        obscur: false,
                        prefixIco: const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        label: "Telephone",
                        typeWord: TextInputType.phone,
                      ),
                      TextFieldPreuse(
                        control: pWD,
                        obscur:
                            !_isPasswordVisible, // Use the _isPasswordVisible to toggle obscureText
                        prefixIco: const Icon(
                          Icons.security,
                          color: Colors.white,
                        ),
                        sufixICO: IconButton(
                          onPressed:
                              _togglePasswordVisibility, // Toggle the visibility of the password
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          color: Colors.white,
                        ),
                        label: "Password",
                        typeWord: TextInputType.text,
                      ),
                      SizedBox(
                        //color: Colors.red,
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                            child: const Text(
                              textAlign: TextAlign.center,
                              'Se connecter',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF6334A9),
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                            onPressed: () => {sendLoginRequest()}),
                      ),
                      const SizedBox(
                        //color: Colors.red,

                        height: 25,
                      ),
                    ],
                  ),
                ),
                //============================================================================================
              )
      ],
    );
  }
}
