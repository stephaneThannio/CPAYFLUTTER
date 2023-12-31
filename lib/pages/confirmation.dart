// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:cpay/items/essaidialog.dart';
import 'package:cpay/items/loadingsimple.dart';
//import 'package:cpay/items/loading.dart';
import 'package:cpay/pages/Accueil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
//import 'package:quickalert/quickalert.dart';

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

  OtpFieldController controlcode = OtpFieldController();
  String code = "";
  String _commingSms = "";
  Future<void> initSmsListener() async {
    String? commingSms;
    try {
      commingSms = await AltSmsAutofill().listenForSms;
    } on PlatformException {
      commingSms = 'Failed to get Sms.';
    }
    if (!mounted) return;
    List<String> codecode = [];
    setState(() {
      _commingSms = commingSms!.substring(21, 27);
      for (int i = 0; i < _commingSms.length; i++) {
        codecode.add(_commingSms[i]);
      }
      controlcode.set(codecode);
    });
  }

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

//==============================================================================
  Future resendcode() async {
    setState(() {
      loading = true;
    });
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
      var data = jsonDecode(request.body);
      {
        if (data["status"] == 'success') {
          setState(() {
            loading = false;
          });
          // alert("validation", data["mdata"].toString(), QuickAlertType.success,
          //     () {
          //   Navigator.pop(context);
          // });
          showalert("succes", 'validation', data["mdata"].toString(), "Valider",
              false, () {
            Navigator.pop(context);
          });
        }
      }
      setState(() {
        loading = false;
      });
      print(request.body);
    } else {
      print('request not send');
    }
  }

  Future sendValidation(String code) async {
    setState(() {
      loading = true;
    });
    //code = nb1.text + nb2.text + nb3.text + nb4.text + nb5.text + nb6.text;
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
      var data = jsonDecode(request.body);
      if (data["status"] == 'success') {
        setState(() {
          loading = false;
        });
        showalert("succes", 'Felicitation', data["mdata"].toString(), "Valider",
            false, () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Accueil()));
        });
      } else {
        setState(() {
          loading = false;
        });
        showalert("error", 'Erreur', data["mdata"].toString(), "Valider", false,
            () {
          Navigator.pop(context);
        });
        // alert("Erreur", data["mdata"].toString(), QuickAlertType.error, () {
        //   Navigator.pop(context);
        // });
      }

      print(request.body);
    } else {
      print('request not send');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    initSmsListener();
    super.initState();
  }

  @override
  void dispose() {
    AltSmsAutofill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: loading
          ? const Loading(
              spincouleur: Color(0xFF6334A9),
            )
          : Scaffold(
              body: Stack(
              children: [
                Align(
                  alignment: const Alignment(0, 0),
                  child: Form(
                    child: SizedBox(
                      height: 400,
                      //color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
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
                                    'Nous allons vous envoyer un code de validation au numero ${widget.phone.toString().replaceRange(0, 8, '**********')}',
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
                            SizedBox(
                              width: 400,
                              height: 200,
                              //color: Colors.orange,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Container(
                                  //color: Colors.red,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: OTPTextField(
                                    controller: controlcode,
                                    spaceBetween: 1,
                                    length: 6,
                                    width: 50,
                                    fieldWidth: 50,
                                    style: TextStyle(fontSize: 17),
                                    textFieldAlignment:
                                        MainAxisAlignment.spaceAround,
                                    fieldStyle: FieldStyle.box,
                                    onCompleted: (pin) {
                                      sendValidation(pin);
                                    },
                                  ),
                                ),
                              ),
                              // child: FittedBox(
                              //   fit: BoxFit.scaleDown,
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceAround,
                              //     children: [
                              //       SizedBox(
                              //         height: 68,
                              //         width: 64,
                              //         child: TextField(
                              //           controller: nb1,
                              //           onChanged: (value) {
                              //             if (value.length == 1) {
                              //               FocusScope.of(context).nextFocus();
                              //             }
                              //           },
                              //           decoration: const InputDecoration(
                              //               border: OutlineInputBorder(
                              //                   borderRadius: BorderRadius.all(
                              //                       Radius.circular(10.0)))),
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .titleLarge,
                              //           keyboardType: TextInputType.number,
                              //           textAlign: TextAlign.center,
                              //           inputFormatters: [
                              //             LengthLimitingTextInputFormatter(1),
                              //             FilteringTextInputFormatter.digitsOnly
                              //           ],
                              //         ),
                              //       ),
                              //       SizedBox(width: 10),
                              //       SizedBox(
                              //         height: 68,
                              //         width: 64,
                              //         child: TextField(
                              //           controller: nb2,
                              //           onChanged: (value) {
                              //             if (value.length == 1) {
                              //               FocusScope.of(context).nextFocus();
                              //             }
                              //           },
                              //           decoration: const InputDecoration(
                              //               border: OutlineInputBorder(
                              //                   borderRadius: BorderRadius.all(
                              //                       Radius.circular(10.0)))),
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .titleLarge,
                              //           keyboardType: TextInputType.number,
                              //           textAlign: TextAlign.center,
                              //           inputFormatters: [
                              //             LengthLimitingTextInputFormatter(1),
                              //             FilteringTextInputFormatter.digitsOnly
                              //           ],
                              //         ),
                              //       ),
                              //       SizedBox(width: 10),
                              //       SizedBox(
                              //         height: 68,
                              //         width: 64,
                              //         child: TextField(
                              //           controller: nb3,
                              //           onChanged: (value) {
                              //             if (value.length == 1) {
                              //               FocusScope.of(context).nextFocus();
                              //             }
                              //           },
                              //           decoration: const InputDecoration(
                              //               border: OutlineInputBorder(
                              //                   borderRadius: BorderRadius.all(
                              //                       Radius.circular(10.0)))),
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .titleLarge,
                              //           keyboardType: TextInputType.number,
                              //           textAlign: TextAlign.center,
                              //           inputFormatters: [
                              //             LengthLimitingTextInputFormatter(1),
                              //             FilteringTextInputFormatter.digitsOnly
                              //           ],
                              //         ),
                              //       ),
                              //       SizedBox(width: 10),
                              //       SizedBox(
                              //         height: 68,
                              //         width: 64,
                              //         child: TextField(
                              //           controller: nb4,
                              //           onChanged: (value) {
                              //             if (value.length == 1) {
                              //               FocusScope.of(context).nextFocus();
                              //             }
                              //           },
                              //           decoration: const InputDecoration(
                              //               border: OutlineInputBorder(
                              //                   borderRadius: BorderRadius.all(
                              //                       Radius.circular(10.0)))),
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .titleLarge,
                              //           keyboardType: TextInputType.number,
                              //           textAlign: TextAlign.center,
                              //           inputFormatters: [
                              //             LengthLimitingTextInputFormatter(1),
                              //             FilteringTextInputFormatter.digitsOnly
                              //           ],
                              //         ),
                              //       ),
                              //       SizedBox(width: 10),
                              //       SizedBox(
                              //         height: 68,
                              //         width: 64,
                              //         child: TextField(
                              //           controller: nb5,
                              //           onChanged: (value) {
                              //             if (value.length == 1) {
                              //               FocusScope.of(context).nextFocus();
                              //             }
                              //           },
                              //           decoration: const InputDecoration(
                              //               border: OutlineInputBorder(
                              //                   borderRadius: BorderRadius.all(
                              //                       Radius.circular(10.0)))),
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .titleLarge,
                              //           keyboardType: TextInputType.number,
                              //           textAlign: TextAlign.center,
                              //           inputFormatters: [
                              //             LengthLimitingTextInputFormatter(1),
                              //             FilteringTextInputFormatter.digitsOnly
                              //           ],
                              //         ),
                              //       ),
                              //       SizedBox(width: 10),
                              //       SizedBox(
                              //         height: 68,
                              //         width: 64,
                              //         child: TextField(
                              //           controller: nb6,
                              //           onChanged: (value) {
                              //             if (value.length == 1) {
                              //               FocusScope.of(context).nextFocus();
                              //             }
                              //           },
                              //           decoration: const InputDecoration(
                              //               border: OutlineInputBorder(
                              //                   borderRadius: BorderRadius.all(
                              //                       Radius.circular(10.0)))),
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .titleLarge,
                              //           keyboardType: TextInputType.number,
                              //           textAlign: TextAlign.center,
                              //           inputFormatters: [
                              //             LengthLimitingTextInputFormatter(1),
                              //             FilteringTextInputFormatter.digitsOnly
                              //           ],
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ),
                            SizedBox(
                              width: 400,
                              height: 100,
                              //color: Colors.green,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 160,
                                    height: 50,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF6334A9)),
                                        onPressed: () => resendcode(),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                            backgroundColor:
                                                const Color(0xFF6334A9)),
                                        onPressed: () => () {},
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                  ),
                )
              ],
            )),
    );
  }
}
