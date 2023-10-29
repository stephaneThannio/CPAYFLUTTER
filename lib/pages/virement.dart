import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:cpay/api/api.dart';
import 'package:cpay/items/essaidialog.dart';
import 'package:cpay/items/loadingsimple.dart';
import 'package:cpay/models/user.dart';
import 'package:cpay/pages/qr_code_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Virement extends StatefulWidget {
  static String ibanQr = '';
  const Virement({super.key});

  @override
  State<Virement> createState() => _VirementState();
}

class _VirementState extends State<Virement> {
  //variables=================================================
  TextEditingController controlmotif = TextEditingController();
  TextEditingController controlibancred = TextEditingController();
  TextEditingController controlmontant = TextEditingController();
  TextEditingController controlcode = TextEditingController();

  int _radioVal = 1;
  bool switchtype = false;
  Icon iconCode = Icon(
    Icons.telegram,
    color: Colors.white,
  );
  String codetxt = "Send code";
  String type_virement = "1";
  String idperiodicity = "";
  String datedeb = DateFormat('yy-MM-dd').format(DateTime.now());
  String datefin = "";

  String montant = "";
  String ibancred = "";
  String code = "";
  String motif = "";
  bool loading = false;
  bool loadingsendcode = false;
  //==========================================================
  //DATE TIME PICKER
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (context, child) => Theme(
          data: ThemeData(primarySwatch: Colors.deepPurple), child: child!),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        datefin = DateFormat('yy-MM-dd').format(selectedDate);
      });
      print(DateFormat('yy-MM-dd').format(selectedDate));
    }
  }

//==========================================================

//Activation typevirement===================================
  affictationvariable() {
    ibancred = controlibancred.text;
    montant = controlmontant.text;
    code = controlcode.text;
    motif = controlmotif.text;
    idperiodicity = type_virement == "1" ? "" : _radioVal.toString();

    print(
        "ibancred: $ibancred montant:$montant code: $code motif:$motif typevirement=$type_virement idperiodicity:$idperiodicity datefin= $datefin");
  }

//==========================================================
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

  String _commingSms = "";
  Future<void> initSmsListener() async {
    String? commingSms;

    try {
      commingSms = await AltSmsAutofill().listenForSms;
    } on PlatformException {
      commingSms = 'Failed to get Sms.';
    }
    if (!mounted) return;

    setState(() {
      _commingSms = commingSms!.substring(21, 27);
      controlcode = TextEditingController(text: _commingSms);
    });
  }

  //======================================
//allfunction===============================================
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
        initSmsListener();
        showalert("succes", "felicitation", request["mdata"], "valider", () {
          Navigator.pop(context);
        });
      }
    }
  }

  sendrequestvirement() async {
    affictationvariable();
    setState(() {
      loading = true;
    });
    var request = await Api.sendMoney(
        ibancred, montant, code, type_virement, idperiodicity, datefin, motif);
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
          controlibancred.clear();
          controlmotif.clear();
          ibancred = "";
          motif = "";
          montant = '';
          code = "";
          switchtype = false;
          iconCode = Icon(
            Icons.telegram,
            color: Colors.white,
          );
          codetxt = "Send code";
        });
      }
    }
  }

  ifscanfait() {
    if (Virement.ibanQr != "") {
      setState(() {
        controlibancred = TextEditingController(text: Virement.ibanQr);
      });
    } else {
      setState(() {
        controlibancred = TextEditingController();
      });
    }
  }

//==========================================================
  @override
  void initState() {
    // TODO: implement initState
    ifscanfait();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: loading
          ? Loading(spincouleur: const Color(0xFF6334A9))
          : Formulaire(screenwidth, screenheight),
    );
  }

  SingleChildScrollView Formulaire(double screenwidth, double screenheight) {
    return SingleChildScrollView(
      child: SizedBox(
        width: screenwidth,
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
                        ' Virement CPAY',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: formulaire(),
                    ),
                    SizedBox(
                      height: 25.sp,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 15.sp,
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
                        onPressed: () => {sendrequestvirement()}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container formulaire() {
    // ignore: avoid_unnecessary_containers
    return Container(
      //color: Colors.amber,
      child: Column(
        children: [
          SizedBox(
            height: 15.sp,
          ),
          SizedBox(
            height: 5.sp,
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
                      Icons.credit_card,
                      size: 60,
                      color: Color(0xFF6334A9),
                    ),
                    onPressed: () => Null),
                Expanded(
                    child: TextField(
                  controller: controlibancred,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: const InputDecoration.collapsed(
                      hintText: "IBAN CPAY DU DESTINATAIRE"),
                )),
                Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      color: Color(0xFF6334A9),
                      borderRadius: BorderRadius.circular(80)),
                  child: IconButton(
                      icon: const Icon(
                        Icons.qr_code,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const QrCode()))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.sp,
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
                      hintText: "Montant MGA a Transferer"),
                ))
              ],
            ),
          ),
          SizedBox(
            height: 5.sp,
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
          ),
          SizedBox(
            height: 5.sp,
          ),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            height: !switchtype ? 70.h : 150.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: const Icon(
                            Icons.mobile_screen_share_rounded,
                            size: 60,
                            color: Color(0xFF6334A9),
                          ),
                          onPressed: () => Null),
                      Expanded(
                        child: Text(
                          'Virement permanent',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Switch(
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                switchtype = value;
                              });
                            }
                            !switchtype
                                ? type_virement = "1"
                                : type_virement = "2";
                            !switchtype ? datefin = "" : datefin = "";
                            print(type_virement);
                          },
                          value: switchtype,
                        ),
                      ),
                    ],
                  ),
                  switchtype
                      ? SizedBox(
                          height: 100.h,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'semestriel',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontFamily: 'PlusJakartaSans',
                                    ),
                                  ),
                                  Text(
                                    'mensuel',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontFamily: 'PlusJakartaSans',
                                    ),
                                  ),
                                  Text(
                                    'annuel',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontFamily: 'PlusJakartaSans',
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [1, 2, 3]
                                    .map(
                                      (int index) => Radio<int>(
                                        value: index,
                                        groupValue: _radioVal,
                                        onChanged: (int? value) {
                                          if (value != null) {
                                            setState(() => _radioVal = value);
                                          }
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                              SizedBox(
                                height: 40,
                                //color: Colors.red,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            datedeb,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                              // fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.calendar_month_outlined,
                                                color: Color(0xFF6334A9),
                                              ))
                                        ],
                                      ),
                                      Text(
                                        "au",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                          // fontFamily: 'PlusJakartaSans',
                                        ),
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            datefin == ""
                                                ? "__-__-__"
                                                : datefin,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                              // fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                _selectDate(context);
                                              },
                                              icon: const Icon(
                                                Icons.calendar_month_outlined,
                                                color: Color(0xFF6334A9),
                                              ))
                                        ],
                                      )
                                    ]),
                              )
                            ],
                          ),
                          // width: 150.w,
                        ).animate().fade()
                      : SizedBox()
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5.sp,
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
                      Icons.receipt_long_sharp,
                      size: 60,
                      color: Color(0xFF6334A9),
                    ),
                    onPressed: () => Null),
                Expanded(
                    child: TextField(
                  controller: controlmotif,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration:
                      const InputDecoration.collapsed(hintText: "Motif"),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
