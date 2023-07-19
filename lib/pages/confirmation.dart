import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

// ignore: must_be_immutable
class Confirmation extends StatefulWidget {
  Confirmation({super.key, required this.phone, required this.pwd});
  String phone;
  String pwd;

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  bool loading = false;
  TextEditingController nb1 = TextEditingController();
  TextEditingController nb2 = TextEditingController();
  TextEditingController nb3 = TextEditingController();
  TextEditingController nb4 = TextEditingController();
  TextEditingController nb5 = TextEditingController();
  TextEditingController nb6 = TextEditingController();
  TextEditingController nb7 = TextEditingController();
  String code = "";
  void verification() {
    code = nb1.text + nb2.text + nb3.text + nb4.text + nb5.text + nb6.text;
    print(code);
  }

  Future resendcode() async {
    final request = await post(Uri.parse('https://api.c-pay.me'),
        body: jsonEncode({
          "app": "cpay",
          "telephone": widget.phone,
          "password": widget.pwd,
          "Autorization": "...",
          "action": "inscription",
          "act": "generate"
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (request.statusCode == 200) {
      setState(() {
        loading = false;
      });
      print(request.body);
    } else {
      print('request not send');
    }
  }

  Future SendValidation() async {
    code = nb1.text + nb2.text + nb3.text + nb4.text + nb5.text + nb6.text;
    final request = await post(Uri.parse('https://api.c-pay.me'),
        body: jsonEncode({
          "app": "cpay",
          "telephone": widget.phone,
          "password": widget.pwd,
          "Autorization": "...",
          "action": "inscription",
          "code": code
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (request.statusCode == 200) {
      setState(() {
        loading = false;
      });
      print(request.body);
    } else {
      print('request not send');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment(0, 0),
          child: Form(
            child: Container(
              height: 400,
              //color: Colors.amber,
              child: Column(
                children: [
                  Container(
                    //color: Colors.blue,
                    width: 500,
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Code de validation',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                        Text(
                          'Nous allons vous envoyer un code de validation au numero ${widget.phone}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 400,
                    height: 200,
                    //color: Colors.orange,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 68,
                          width: 64,
                          child: TextField(
                            controller: nb1,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)))),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 68,
                          width: 64,
                          child: TextField(
                            controller: nb2,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)))),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 68,
                          width: 64,
                          child: TextField(
                            controller: nb3,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)))),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 68,
                          width: 64,
                          child: TextField(
                            controller: nb4,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)))),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 68,
                          width: 64,
                          child: TextField(
                            controller: nb5,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)))),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 68,
                          width: 64,
                          child: TextField(
                            controller: nb6,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)))),
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 400,
                    height: 100,
                    //color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 160,
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF6334A9)),
                              onPressed: () => resendcode(),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.refresh,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Renvoyer',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'PlusJakartaSans',
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 160,
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF6334A9)),
                              onPressed: () => verification(),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    'valider',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'PlusJakartaSans',
                                    ),
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
