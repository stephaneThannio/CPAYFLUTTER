import 'dart:convert';

import 'package:cpay/items/loading.dart';
import 'package:cpay/pages/confirmation.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../items/TextFieldPreuse.dart';
import 'package:http/http.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController phonenbr = TextEditingController();
  //TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();
  TextEditingController cpwd = TextEditingController();
  String phone = "";
  //String mail="";
  String password = "";
  String cpassword = "";
  bool loading = false;
  void enregisterAUTH() {
    phone = phonenbr.text;
    //mail = email.text;
    password = pwd.text;
    cpassword = cpwd.text;
    print("phone = $phone, password =$password cpassword =$cpassword");
  }

  void Alert(String titreAlert, String TextAlert, QuickAlertType typeAlert,
      VoidCallback func) {
    QuickAlert.show(
        context: context,
        type: typeAlert,
        title: titreAlert,
        text: TextAlert,
        onConfirmBtnTap: func);
  }

  void Confirm() {
    phone = phonenbr.text;
    //mail = email.text;
    password = pwd.text;
    cpassword = cpwd.text;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Confirmation(
                  phone: phone,
                  pwd: cpassword,
                )));
  }

  Future sendCreateAccountRequest() async {
    phone = phonenbr.text;
    //mail = email.text;
    password = pwd.text;
    cpassword = cpwd.text;
    if (password == cpassword) {
      setState(() {
        loading = true;
      });
      final request = await post(Uri.parse('https://api.c-pay.me'),
          body: jsonEncode({
            "app": "cpay",
            "telephone": phone,
            "password": cpassword,
            "Autorization": "...",
            "action": "inscription",
            "act": "generate"
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      if (request.statusCode == 200) {
        var data = jsonDecode(request.body);
        if (data["status"] == 'success') {
          setState(() {
            loading = false;
          });
          Alert("validation", "Code de validation envoyer.",
              QuickAlertType.success, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Confirmation(
                          phone: phone,
                          pwd: cpassword,
                        )));
          });
        } else if (data["status"] == 'error') {
          setState(() {
            loading = false;
          });
          Alert("Error", "telephone deja utiliser", QuickAlertType.error, () {
            Navigator.pop(context);
          });
        }
        print(request.body);
      } else {
        print('request not send');
      }
    } else {
      print('veillez confiremer le mot de passe');
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
                                'Create',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                'ACCOUNT',
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
                        // TextFieldPreuse(
                        //   control: usernam,
                        //   obscur: false,
                        //   prefixIco: const Icon(
                        //     Icons.person,
                        //     color: Colors.white,
                        //   ),
                        //   sufixICO: Icon(null),
                        //   label: "your Name",
                        //   typeWord: TextInputType.name,
                        // ),
                        TextFieldPreuse(
                          control: phonenbr,
                          obscur: false,
                          prefixIco: const Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          sufixICO: const Icon(null),
                          label: "Your Phone number",
                          typeWord: TextInputType.phone,
                        ),
                        SizedBox(
                          //color: Colors.red,
                          width: 300,
                          height: 50,
                          child: TextFieldPreuse(
                            control: pwd,
                            obscur: true,
                            prefixIco: const Icon(
                              Icons.security,
                              color: Colors.white,
                            ),
                            sufixICO: const Icon(
                              Icons.check_sharp,
                              color: Colors.white,
                            ),
                            label: "Your password",
                            typeWord: TextInputType.text,
                          ),
                        ),
                        SizedBox(
                          //color: Colors.red,
                          width: 300,
                          height: 50,
                          child: TextFieldPreuse(
                            control: cpwd,
                            obscur: true,
                            prefixIco: const Icon(
                              Icons.security,
                              color: Colors.white,
                            ),
                            sufixICO: const Icon(
                              Icons.check_sharp,
                              color: Colors.white,
                            ),
                            label: "Confirm your password",
                            typeWord: TextInputType.text,
                          ),
                        ),
                        SizedBox(
                          //color: Colors.red,
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            child: const Text(
                              textAlign: TextAlign.center,
                              'Valider',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF6334A9),
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                            onPressed: () => {
                              sendCreateAccountRequest(),
                              //Confirm()
                            },
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
