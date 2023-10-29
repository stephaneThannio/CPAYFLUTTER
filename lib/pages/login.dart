//import 'package:cpay/pages/myAccount/myAccunt.dart';
// ignore_for_file: avoid_print, duplicate_ignore

import 'dart:async';
import 'dart:convert';
import 'package:cpay/items/essaidialog.dart';
import 'package:cpay/items/loadingsimple.dart';
//import 'package:cpay/items/loading.dart';
import 'package:cpay/models/user.dart';
import 'package:cpay/pages/Accueil.dart';
import 'package:cpay/pages/confirmation.dart';
import 'package:cpay/pages/createAcount.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:quickalert/quickalert.dart';
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
//Alert======================================================================
  // void alert(String titreAlert, String textAlert, QuickAlertType typeAlert,
  //     VoidCallback func) {
  //   QuickAlert.show(
  //     context: context,
  //     type: typeAlert,
  //     title: titreAlert,
  //     text: textAlert,
  //     onConfirmBtnTap: func,
  //     confirmBtnColor: const Color(0xFF6334A9),
  //   );
  // }

  void showalert(String type, String titrealert, String descri,
      String textsurboutton, bool annulerBtn, VoidCallback functionConfirm) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertAlert(
              typealert: type,
              titleAlert: titrealert,
              descriAlert: descri,
              confirmbtnText: textsurboutton,
              cancelbtn: annulerBtn,
              onpresConfirm: functionConfirm,
            ));
  }

//=======================================================================================================
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

  sendLoginRequest() async {
    tel = uName.text;
    password = pWD.text;
    if (tel == '' && password == '') {
      showalert("error", 'Erreur', 'veillez remplir le champ', "Valider", false,
          notWelcome);
    } else {
      setState(() {
        loading = true;
      });
      try {
        final request = await post(Uri.parse('https://api.c-pay.me'),
            body: jsonEncode(
              {
                "app": "cpay",
                "login": tel,
                "password": password,
                "Autorization": "...",
                "action": "authentification"
              },
            ),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            }).timeout(const Duration(seconds: 15));
        // ignore: duplicate_ignore
        if (request.statusCode == 200) {
          var data = jsonDecode(request.body);
          if (data["status"] == 'logged_in') {
            setState(() {
              loading = false;
              User.saveUser(User.fromJson(jsonDecode(data["mdata"])));
              print(data);
            });

            showalert(
                "succes",
                'bienvenue',
                'Vous etes maintenant connecter a cpay',
                "Valider",
                false,
                welcome);
          } else if (data["status"] == 'error') {
            setState(() {
              loading = false;
            });
            showalert("error", 'Erreur', data['mdata'].toString(), "Valider",
                false, notWelcome);
          } else if (data["status"] == 'warning') {
            setState(() {
              loading = false;
            });
            showalert("warning", 'Attention', data['mdata'].toString(),
                "Valider", false, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Confirmation(phone: tel, pwd: password)));
            });
          }
        } else {}
      } catch (error) {
        if (error is TimeoutException) {
          setState(() {
            loading = false;
            showalert("error", 'TimeOut', "erreur de connexion au serveur",
                "Valider", false, notWelcome);
          });
        }
      }
    }
  }

  bool pagechange = false;
  @override
  Widget build(BuildContext context) {
    //double screenheight = MediaQuery.of(context).size.height;
    return !pagechange
        ? SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(scale: 8.sp, ('lib/photos/285-min.png')),
                Container(
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
                  width: 100.w,
                  height: 28.h,
                ),
                loading
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: const Loading(
                          spincouleur: Colors.white,
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: 20.sp,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                'Authentification',
                                style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          SizedBox(
                            width: 280.sp,
                            height: 50.sp,
                            child: TextFieldPreuse(
                              control: uName,
                              obscur: false,
                              prefixIco: Icon(
                                size: 20.sp,
                                Icons.phone,
                                color: Colors.white,
                              ),
                              label: "Telephone",
                              typeWord: TextInputType.phone,
                            ),
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          SizedBox(
                            width: 280.sp,
                            height: 50.sp,
                            child: TextFieldPreuse(
                              control: pWD,
                              obscur:
                                  !_isPasswordVisible, // Use the _isPasswordVisible to toggle obscureText
                              prefixIco: Icon(
                                Icons.security,
                                size: 20.sp,
                                color: Colors.white,
                              ),
                              sufixICO: IconButton(
                                onPressed:
                                    _togglePasswordVisibility, // Toggle the visibility of the password
                                icon: Icon(
                                  size: 20.sp,
                                  _isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                color: Colors.white,
                              ),
                              label: "Password",
                              typeWord: TextInputType.text,
                            ),
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          SizedBox(
                            //color: Colors.red,
                            width: 280.sp,
                            height: 48.sp,
                            child: ElevatedButton(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Se connecter',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.normal,
                                    color: const Color(0xFF6334A9),
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                ),
                                onPressed: () => {sendLoginRequest()}),
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          SizedBox(
                            //color: Colors.red,
                            width: 140.sp,
                            height: 25.sp,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF6334A9),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: const BorderSide(
                                            width: 1, color: Colors.white))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.center,
                                      'S\'inscrire',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                        fontFamily: 'PlusJakartaSans',
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                onPressed: () => {
                                      setState(() {
                                        pagechange = true;
                                      })
                                    }),
                          ),
                        ],
                      )
              ],
            ),
          )
        : const CreateAccount();
  }
}
