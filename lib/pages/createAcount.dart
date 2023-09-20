// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:cpay/items/essaidialog.dart';
//import 'package:cpay/items/loading.dart';
import 'package:cpay/items/loadingsimple.dart';
import 'package:cpay/pages/confirmation.dart';
import 'package:cpay/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:quickalert/quickalert.dart';

import '../items/TextFieldPreuse.dart';
import 'package:http/http.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

//test
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

//Alert============================================================================
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

//=======================================================================
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
    if (phone.length < 10) {
      // alert('Erreur', 'le numero n est pas correct', QuickAlertType.error, () {
      //   Navigator.pop(context);
      // });
      showalert(
          "error", 'Erreur', 'le numero n est pas correct', "Valider", false,
          () {
        Navigator.pop(context);
      });
    } else {
      if (password == cpassword) {
        setState(() {
          loading = true;
        });
        try {
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
              }).timeout(const Duration(seconds: 20));
          if (request.statusCode == 200) {
            var data = jsonDecode(request.body);
            if (data["status"] == 'success') {
              setState(() {
                loading = false;
              });
              // alert("validation", "Code de validation envoyer.",
              //     QuickAlertType.success, () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => Confirmation(
              //                 phone: phone,
              //                 pwd: cpassword,
              //               )));
              // });
              showalert("succes", 'validation', 'Code de validation envoyer.',
                  "Valider", false, () {
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
              // alert("Error", data["mdata"].toString(), QuickAlertType.error,
              //     () {
              //   Navigator.pop(context);
              // });
              showalert(
                  "error", 'Erreur', data["mdata"].toString(), "Valider", false,
                  () {
                Navigator.pop(context);
              });
            }
            print(request.body);
          } else {
            print('request not send');
          }
        } catch (error) {
          if (error is TimeoutException) {
            setState(() {
              loading = false;
              // alert("Error", "erreur de connection", QuickAlertType.error, () {
              //   Navigator.pop(context);
              // });
              showalert(
                  "error", 'Erreur', "erreur de connection", "Valider", false,
                  () {
                Navigator.pop(context);
              });
            });
          }
        }
      } else {
        showalert("error", 'Erreur', "Veillez verifeir le mot de passe",
            "Valider", false, () {
          Navigator.pop(context);
        });
        // alert("Error", "Veillez verifeir le mot de passe", QuickAlertType.error,
        //     () {
        //   Navigator.pop(context);
        // });
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
              children: <Widget>[
                //la photo de logo cpay==========================================================
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(scale: 8.sp, ('lib/photos/285-min.png')),
                    //l'ombre======================================================
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
                                    'Create ACCOUNT',
                                    style: TextStyle(
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                      fontFamily: 'PlusJakartaSans',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.sp,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 280.sp,
                                height: 50.sp,
                                child: TextFieldPreuse(
                                  control: phonenbr,
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
                                //color: Colors.red,
                                width: 280.sp,
                                height: 50.sp,
                                child: TextFieldPreuse(
                                  control: pwd,
                                  obscur: true,
                                  prefixIco: Icon(
                                    size: 20.sp,
                                    Icons.security,
                                    color: Colors.white,
                                  ),
                                  sufixICO: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.check_sharp,
                                      size: 20.sp,
                                    ),
                                    color: Colors.white,
                                  ),
                                  label: "Mot de passe",
                                  typeWord: TextInputType.text,
                                ),
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              SizedBox(
                                //color: Colors.red,
                                width: 280.sp,
                                height: 50.sp,
                                child: TextFieldPreuse(
                                  control: cpwd,
                                  obscur: true,
                                  prefixIco: Icon(
                                    size: 20.sp,
                                    Icons.security,
                                    color: Colors.white,
                                  ),
                                  sufixICO: IconButton(
                                    onPressed: () {},
                                    icon: Icon(size: 20.sp, Icons.check_sharp),
                                    color: Colors.white,
                                  ),
                                  label: "Confirmation du mot de passe",
                                  typeWord: TextInputType.text,
                                ),
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              SizedBox(
                                //color: Colors.red,
                                width: 280.sp,
                                height: 50.sp,
                                child: ElevatedButton(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'S\'inscrire',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.normal,
                                      color: const Color(0xFF6334A9),
                                      fontFamily: 'PlusJakartaSans',
                                    ),
                                  ),
                                  onPressed: () => {
                                    sendCreateAccountRequest(),
                                    //Confirm()
                                  },
                                ),
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
                                        backgroundColor:
                                            const Color(0xFF6334A9),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side: const BorderSide(
                                                width: 1,
                                                color: Colors.white))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          textAlign: TextAlign.center,
                                          'Se connecter',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                            fontFamily: 'PlusJakartaSans',
                                          ),
                                        ),
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
                )
              ],
            ),
          )
        : const Login();
  }
}
