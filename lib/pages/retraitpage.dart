import 'package:cpay/api/api.dart';
//import 'package:cpay/items/error/errorTimeout.dart';
import 'package:cpay/items/essaidialog.dart';
//import 'package:cpay/items/loading.dart';
//import 'package:cpay/items/loading_depot.dart';
import 'package:cpay/items/loadingsimple.dart';
//import 'package:cpay/items/loadingsimple.dart';
import 'package:cpay/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:quickalert/quickalert.dart';

class RetraitPage extends StatefulWidget {
  const RetraitPage({
    super.key,
  });

  @override
  State<RetraitPage> createState() => _RetraitPageState();
}

class _RetraitPageState extends State<RetraitPage> {
  String paymenmode = "Mvola";
  bool loading = false;
  bool loadingsendcode = false;
  bool enabled = false;
  Color mvolaContentColor = Colors.green;
  //Mvola
  //TextEditingController controliban = TextEditingController();
  TextEditingController controlmontant = TextEditingController();
  TextEditingController controlcode = TextEditingController();
  Icon iconCode = Icon(
    Icons.telegram,
    color: Colors.white,
  );
  String codetxt = "Send code";
  //String iban = '';
  String montant = '';
  String code = '';
  bool uneerreur = false;
  //Alert==================================
  void showalert(String type, String titreAlert, String descri,
      String textsurboutton, VoidCallback func) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertAlert(
              typealert: type,
              titleAlert: titreAlert,
              descriAlert: descri,
              onpresConfirm: func,
            ));
  }
  //======================================

//fuction
  sendCode() async {
    montant = controlmontant.text;
    setState(() {
      loadingsendcode = true;
    });
    var request = await Api.send3dcode(montant);
    if (request != {}) {
      setState(() {
        loadingsendcode = false;
        iconCode = Icon(Icons.refresh, color: Colors.white);
        codetxt = "Resend code";
      });
      if (request["status"] == "success") {
        showalert("succes", "felicitation", request["mdata"], "valider", () {
          Navigator.pop(context);
        });
      }
    }
  }

  sendrequestretrait() async {
    montant = controlmontant.text;
    code = controlcode.text;
    setState(() {
      loading = true;
    });
    var request = await Api.sendretirer(montant, code);
    if (request != {}) {
      setState(() {
        loading = false;
        iconCode = Icon(Icons.refresh, color: Colors.white);
        codetxt = "Resend code";
      });
      if (request["status"] == "success") {
        showalert("succes", "felicitation", request["mdata"], "valider", () {
          Navigator.pop(context);
          controlmontant.clear();
          controlcode.clear();
          montant = '';
          code = "";
        });
      }
    }
  }

//===========
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: loading
            ? Loading(spincouleur: const Color(0xFF6334A9))
            : Formulaire(screenwidth, screenheight));
  }

  SingleChildScrollView Formulaire(double screenwidth, double screenheight) {
    return SingleChildScrollView(
      child: SizedBox(
        width: screenwidth,
        height: MediaQuery.of(context).size.height,
        // height:
        //     paymenmode == "Mvola" ? screenheight : screenheight * 1.2,
        child: Column(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF6334A9),
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.sp,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        ' Retirer de l\'argent',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        ' Veillez remplir le formulaire',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: formulaireMvola(),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Retrait Via:',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF6334A9),
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                    SizedBox(
                      height: 40.sp,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 100.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              //setAnimation();
                              //onBouttonMvolatap();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: mvolaContentColor,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 100.h,
                              width: 100.w,
                              child: paymenmode == "Mvola"
                                  ? Card(
                                      elevation: 6,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                            'lib/photos/mvola.webp'),
                                      ),
                                    ).animate().shake()
                                  : Card(
                                      elevation: 6,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                            'lib/photos/mvola.webp'),
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.sp,
                    ),
                    SizedBox(
                      width: 200.w,
                      height: 50.h,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6334A9)),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Continuer',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontFamily: 'PlusJakartaSans',
                            ),
                          ),
                          onPressed: () => {
                                montant == "" && code == ""
                                    ? showalert(
                                        "type",
                                        "error",
                                        "veillez remplire les champ",
                                        "valider", () {
                                        Navigator.pop(context);
                                      })
                                    : sendrequestretrait()
                              }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container formulaireMvola() {
    // ignore: avoid_unnecessary_containers
    return Container(
      //color: Colors.amber,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            height: 70.h,
            child: Row(
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.money,
                      size: 60,
                      color: Color(0xFF6334A9),
                    ),
                    onPressed: () => Null),
                Expanded(
                    child: TextField(
                  controller: controlmontant,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: const InputDecoration.collapsed(
                      hintText: "Montant MGA a retirer"),
                ))
              ],
            ),
          ),
          SizedBox(
            height: 40.sp,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            height: 70.h,
            child: Row(
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.lock,
                      size: 60,
                      color: Color(0xFF6334A9),
                    ),
                    onPressed: () => Null),
                Expanded(
                    child: !loadingsendcode
                        ? TextField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6)
                            ],
                            controller: controlcode,
                            keyboardType: TextInputType.phone,
                            maxLines: 1,
                            decoration: InputDecoration.collapsed(
                                hintStyle: TextStyle(fontSize: 11.sp),
                                hintText:
                                    "code sur le telephone  ${User.sessionUser!.telephone.toString().replaceRange(0, 8, '**********')}"),
                          )
                        : Loading(spincouleur: Color(0xFF6334A9))),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 100.w,
                  height: 35.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: const Color(0xFF6334A9)),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            iconCode,
                            Text(
                              textAlign: TextAlign.center,
                              codetxt,
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () => {sendCode()}),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
