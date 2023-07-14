//import 'package:cpay/pages/myAccount/myAccunt.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../items/TextFieldPreuse.dart';

class Login extends StatelessWidget {
  const Login({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    TextEditingController uName = TextEditingController();
    TextEditingController pWD = TextEditingController();
    String username = "";
    String password = "";
    void enregister() {
      username = uName.text;
      password = pWD.text;
      print("username = $username, password =$password");
    }

    Future sendLoginRequest() async {
      final request = await post(Uri.parse('https://api.c-pay.me'),
          body: jsonEncode({
            "app": "cpay",
            "login": "0343787731",
            "password": "1234",
            "Autorization": "...",
            "action": "authentification"
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      if (request.statusCode == 200) {
        print(request.body);
      } else {
        print('request not send');
      }
    }

    return Container(
      child: Stack(
        children: <Widget>[
          //la photo de logo cpay==========================================================
          Align(
            alignment: const Alignment(0, -0.7),
            child: Container(
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
                    offset: Offset(0, 4),
                    blurRadius: 20,
                  ),
                ],
              ),
              width: 120,
              height: 30,
            ),
          ),
          Align(
            alignment: Alignment(0, 0.9),
            child: Container(
              //container qui englobe les formulaire==========================================
              //color: Colors.yellow,
              height: 440,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    //color: Colors.red,
                    width: 300,
                    height: 50,
                    child: const Row(
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
                    sufixICO: Icon(null),
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
                  Container(
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
                  Container(
                    //color: Colors.red,
                    width: 300,
                    height: 50,
                    child: const Column(
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
                  Container(
                    //color: Colors.red,
                    width: 300,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //color: Colors.green,
                          width: 50,
                          height: 50,
                          child: IconButton(
                            icon: Image.asset(('lib/photos/Facebook-logo.png')),
                            onPressed: () => print('log in facebook'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          //color: Colors.green,
                          width: 50,
                          height: 50,
                          child: IconButton(
                            icon: Image.asset(('lib/photos/google-logo.png')),
                            onPressed: () => print('log in google'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          //color: Colors.green,
                          width: 50,
                          height: 50,
                          child: IconButton(
                            icon: Image.asset(('lib/photos/twiter-logo.png')),
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
