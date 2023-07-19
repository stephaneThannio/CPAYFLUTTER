//import 'package:cpay/pages/myAccount/myAccunt.dart';
import 'dart:convert';
import 'package:cpay/items/loading.dart';
import 'package:cpay/models/user.dart';
import 'package:cpay/pages/Accueil.dart';
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
  Duration dur = Duration(days: 365);

  void Alert(String titreAlert, String TextAlert, QuickAlertType typeAlert,
      VoidCallback func) {
    QuickAlert.show(
        context: context,
        type: typeAlert,
        title: titreAlert,
        text: TextAlert,
        onConfirmBtnTap: func);
  }

  void Welcome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Accueil()));
  }

  void NotWelcome() {
    Navigator.pop(context);
  }

  Future sendLoginRequest() async {
    tel = uName.text;
    password = pWD.text;
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
    if (request.statusCode == 200) {
      var data = jsonDecode(request.body);
      if (data["status"] == 'logged_in') {
        setState(() {
          loading = false;
          User.saveUser(User.fromJson(jsonDecode(data["mdata"])));
        });
        Alert("bienvenue", "vous etes connecter", QuickAlertType.success,
            Welcome);
      } else if (data["status"] == 'error') {
        setState(() {
          loading = false;
        });
        Alert("Error", "Login ou mot de passe incorrect", QuickAlertType.error,
            NotWelcome);
      }
      // print(data["status"]);
      print(data['mdata']);
    } else {
      print('request not send');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
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
              ? Loading()
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
                                'welcome to',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                'c-Pay',
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
                          sufixICO: const Icon(null),
                          label: "Telephone",
                          typeWord: TextInputType.phone,
                        ),
                        TextFieldPreuse(
                          control: pWD,
                          obscur: true,
                          prefixIco: const Icon(
                            Icons.security,
                            color: Colors.white,
                          ),
                          sufixICO: const Icon(
                            Icons.remove_red_eye,
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
                                'Sign in',
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
                          width: 300,
                          height: 50,
                          child: Column(
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                'OR',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                'Sign in with',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          //color: Colors.red,
                          width: 300,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                //color: Colors.green,
                                width: 50,
                                height: 50,
                                child: IconButton(
                                  icon: Image.asset(
                                      ('lib/photos/Facebook-logo.png')),
                                  onPressed: () => print('log in facebook'),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                //color: Colors.green,
                                width: 50,
                                height: 50,
                                child: IconButton(
                                  icon: Image.asset(
                                      ('lib/photos/google-logo.png')),
                                  onPressed: () => print('log in google'),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                //color: Colors.green,
                                width: 50,
                                height: 50,
                                child: IconButton(
                                  icon: Image.asset(
                                      ('lib/photos/twiter-logo.png')),
                                  onPressed: () => print('log in twiter'),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  //============================================================================================
                )
        ],
      ),
    );
  }
}