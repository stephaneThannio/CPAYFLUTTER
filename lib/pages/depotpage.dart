import 'package:cpay/api/api.dart';
import 'package:cpay/items/essaidialog.dart';
//import 'package:cpay/items/loading.dart';
import 'package:cpay/items/loading_depot.dart';
//import 'package:cpay/items/loadingsimple.dart';
import 'package:cpay/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:quickalert/quickalert.dart';

class PageDepot extends StatefulWidget {
  const PageDepot({
    super.key,
  });

  @override
  State<PageDepot> createState() => _PageDepotState();
}

class _PageDepotState extends State<PageDepot> {
  String paymenmode = "Mvola";
  bool loading = false;
  bool enabled = false;
  Color mvolaContentColor = Colors.green;
  Color banktransferContentcolor = Colors.transparent;
  //Mvola
  TextEditingController controliban = TextEditingController();
  TextEditingController controlmontant = TextEditingController();
  TextEditingController controlnum = TextEditingController();

  String iban = '';
  String montant = '';
  String numero = '';
  //=====================================
  //Banc Transfert
  TextEditingController controlibanBNCT = TextEditingController();
  TextEditingController controlmontantBNCT = TextEditingController();
  String ibanBCNT = '';
  String montantBCNT = '0';
  String montantEuro = '1';
  String reference = '';
  String iban_bank = 'MG4600006000080000114617359';
  String bank_bic = 'MCBLMGMGXXX';
  String bank_nom = 'The Mauritius Commercial Bank (Madagascar) S.A';
  String bank_domiciliation =
      'Novotel Business Center Alarobia, Route des Hydrocarbures, ANTANANARIVO 101';
  bool visibleInfoBNC = false;
  //alert================================================================================
  // void alert(
  //   String titreAlert,
  //   String textAlert,
  //   QuickAlertType typeAlert,
  // ) {
  //   QuickAlert.show(
  //     context: context,
  //     type: typeAlert,
  //     title: titreAlert,
  //     text: textAlert,
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

//=======================================================================================
  onBouttonMvolatap() {
    setState(() {
      paymenmode = "Mvola";
      visibleInfoBNC = false;
    });
    setColor();
  }

  onButtonBanktransfertap() {
    setState(() {
      paymenmode = "banc transfert";
    });
    // Future.delayed(Duration(milliseconds: 200), () {
    //   setState(() {
    //     visibleInfoBNC = true;
    //   });
    // });
    setColor();
  }

  setColor() {
    if (paymenmode == "Mvola") {
      setState(() {
        mvolaContentColor = Colors.green;
        banktransferContentcolor = Colors.transparent;
      });
    } else if (paymenmode == "banc transfert") {
      setState(() {
        mvolaContentColor = Colors.transparent;
        banktransferContentcolor = Colors.green;
      });
    }
  }

  afterSucces(var resi) async {
    var req2 = await Api.listenStatus(resi['serverCorrelationId']);

    if (req2['status'] == "completed") {
      setState(() {
        loading = false;
        // alert('Succes', 'felicitation le compte a bien ete crediter ',
        //     QuickAlertType.success);
        showalert(
            "succes",
            'Succes',
            'felicitation le compte a bien ete crediter ',
            "Valider",
            false, () {
          Navigator.pop(context);
        });
      });
    } else if (req2['status'] == "pending") {
      Future.delayed(const Duration(seconds: 1), () {
        afterSucces(resi);
      });
    } else if (req2['status'] == "failed") {
      setState(() {
        loading = false;
        // alert("Transaction echouée", "la transaction a été rejetée",
        //     QuickAlertType.error);
        showalert("error", '"Transaction echouée"',
            "la transaction a été rejetée", "Valider", false, () {
          Navigator.pop(context);
        });
      });
    }
  }

  //fonction depot===================================================================
  Future onpressContinuerMvola() async {
    setState(() {
      loading = true;
    });
    iban = controliban.text;
    montant = controlmontant.text;
    numero = controlnum.text;

    var res = await Api.faireDepotMvola(iban, montant, numero);
    print(res);
    if (res['status'] == "Success") {
      afterSucces(res);
    } else if (res['status'] == "Warning") {
      setState(() {
        loading = false;
        // alert('titreAlert', res['mdata'].toString(), QuickAlertType.warning);
        showalert(
            "warning", 'Attention', res['mdata'].toString(), "Valider", false,
            () {
          Navigator.pop(context);
        });
      });
    } else if (res['status'] == "Error") {
      setState(() {
        loading = false;
        // alert('titreAlert', res['mdata'].toString(), QuickAlertType.error);
        showalert("error", 'Erreur', res['mdata'].toString(), "Valider", false,
            () {
          Navigator.pop(context);
        });
      });
    } else if (res['status'] == "timeOut") {
      setState(() {
        loading = false;
        //alert('titreAlert', "erreur du connexion", QuickAlertType.error);
        showalert("error", 'Erreur', "erreur du connexion", "Valider", false,
            () {
          Navigator.pop(context);
        });
      });
    }
  }

  Future onpressbanktransfertcontinue() async {
    setState(() {
      loading = true;
    });
    ibanBCNT = controlibanBNCT.text;
    montantBCNT = controlmontantBNCT.text;

    //print("iban:$iban,montant:$montant, numero:$numero");
    var res = await Api.sendrequestdepositBnktransfer(
        ibanBCNT, montantBCNT, reference);
    //print(res);
    if (res['status'] == "success") {
      setState(() {
        loading = false;
        //alert('titreAlert', res['mdata'].toString(), QuickAlertType.success);
        showalert("succes", 'succes', res['mdata'].toString(), "Valider", false,
            () {
          Navigator.pop(context);
        });
      });
    } else if (res['status'] == "error") {
      setState(() {
        loading = false;
        // alert('titreAlert', res['mdata'].toString(), QuickAlertType.error);
        showalert("error", 'error', res['mdata'].toString(), "Valider", false,
            () {
          Navigator.pop(context);
        });
      });
    }
  }

  ifibannotnul() {
    User.getUser();
    if (User.sessionUser != null) {
      setState(() {
        controliban = TextEditingController(text: User.sessionUser!.iban);
        controlibanBNCT = TextEditingController(text: User.sessionUser!.iban);
        enabled = false;
      });
    } else {
      setState(() {
        controliban = TextEditingController();
        controlibanBNCT = TextEditingController();
        enabled = true;
      });
    }
  }

  onContunueBNCT() {
    ibanBCNT = controlibanBNCT.text;
    montantBCNT = controlmontantBNCT.text;
    //print("IBAN: $ibanBCNT,MONTANT:$montantBCNT");
  }

  Future getREF() async {
    ibanBCNT = controlibanBNCT.text;
    montantBCNT = controlmontantBNCT.text;
    // Map<String, dynamic> listrespons = {};
    // Map<String, dynamic> res = await Api.getReference(ibanBCNT, montantBCNT);
    var res = await Api.getReference(ibanBCNT, montantBCNT);

    setState(() {
      // montantEuro = res.entries.elementAt(0).value;
      // reference = res.entries.elementAt(1).value;
      // iban_bank = res.entries.elementAt(2).value;
      // bank_bic = res.entries.elementAt(3).value;
      // bank_nom = res.entries.elementAt(4).value;
      // bank_domiciliation = res.entries.elementAt(5).value;
      montantEuro = res["euro"];
      reference = res["reference"];
      iban_bank = res["iban_bank"];
      bank_bic = res["bank_BIC"];
      bank_nom = res["bank_nom"];
      bank_domiciliation = res["bank_domicialiation"];
    });
    //print(res);
  }

  //===================================================================
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ifibannotnul();
    controlmontantBNCT.text = "0";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controlmontantBNCT.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return loading
        ? LoadingDepot(
            alingementmainax: MainAxisAlignment.center,
            titreLoadingDepot: "Attente acceptation du paiment",
            contenttext: "verifiez votre telephone",
            spincouleur: const Color(0xFF6334A9),
            containcouleur: Colors.white,
            hauteurContainer: screenheight,
          )
        : Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                width: screenwidth,
                // height:
                //     paymenmode == "Mvola" ? screenheight : screenheight * 1.2,
                child: Column(
                  children: [
                    Center(
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                        width: screenwidth,
                        height: paymenmode == "Mvola"
                            ? screenheight * 0.6
                            : screenheight * 0.7,
                        decoration: BoxDecoration(
                            color: const Color(0xFF6334A9),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 30.sp,
                                    ),
                                    Text(
                                      'Faire un depot',
                                      style: TextStyle(
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: 'PlusJakartaSans',
                                      ),
                                    ),
                                    Text(
                                      'Veillez remplir le formulaire',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                        fontFamily: 'PlusJakartaSans',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: paymenmode == "Mvola"
                                    ? formulaireMvola()
                                    : formulairBanktransfer().animate().fade(
                                        duration: const Duration(seconds: 1)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'METHODE DE PAIEMENT',
                              style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF6334A9),
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
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
                                    onBouttonMvolatap();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: mvolaContentColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 100.h,
                                    width: 100.w,
                                    child: paymenmode == "Mvola"
                                        ? Card(
                                            elevation: 6,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                  'lib/photos/mvola.webp'),
                                            ),
                                          ).animate().shake()
                                        : Card(
                                            elevation: 6,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                  'lib/photos/mvola.webp'),
                                            ),
                                          ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    onButtonBanktransfertap();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: banktransferContentcolor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 100.h,
                                    width: 100.w,
                                    child: paymenmode == "banc transfert"
                                        ? Card(
                                            elevation: 6,
                                            child: Image.asset(
                                                'lib/photos/banktransfert.png'),
                                          ).animate().shake()
                                        : Card(
                                            elevation: 6,
                                            child: Image.asset(
                                                'lib/photos/banktransfert.png'),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
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
                                      paymenmode == "Mvola"
                                          ? onpressContinuerMvola()
                                          : onpressbanktransfertcontinue(),
                                    }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Container formulaireMvola() {
    // ignore: avoid_unnecessary_containers
    return Container(
      //color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      Icons.credit_card,
                      size: 60,
                      color: Color(0xFF6334A9),
                    ),
                    onPressed: () => Null),
                Expanded(
                    child: TextField(
                  controller: controliban,
                  enabled: enabled,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: const InputDecoration.collapsed(
                      hintText: "IBAN CPAY DU DESTINATAIRE"),
                ))
              ],
            ),
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
                  decoration:
                      const InputDecoration.collapsed(hintText: "Montant MGA"),
                ))
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            height: 70.h,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Null,
                  icon: const Icon(
                    Icons.phone,
                    size: 60,
                    color: Color(0xFF6334A9),
                  ),
                ),
                Expanded(
                    child: TextField(
                  controller: controlnum,
                  keyboardType: TextInputType.phone,
                  maxLines: 1,
                  decoration: const InputDecoration.collapsed(
                      hintText: "Telephone MVOLA"),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Container formulairBanktransfer() {
    return Container(
      //color: Colors.amber,
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        Icons.credit_card,
                        size: 60,
                        color: Color(0xFF6334A9),
                      ),
                      onPressed: () => Null),
                  Expanded(
                      child: TextField(
                    onChanged: (value) => {getREF()},
                    controller: controlibanBNCT,
                    enabled: enabled,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    decoration: const InputDecoration.collapsed(
                        hintText: "IBAN CPAY DU DESTINATAIRE"),
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 8.sp,
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
                    onChanged: (value) => {getREF()},
                    controller: controlmontantBNCT,
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    decoration: const InputDecoration.collapsed(
                        hintText: "Montant MGA"),
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Material(
                borderRadius: BorderRadius.circular(5),
                elevation: 4.0,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF343a40),
                      borderRadius: BorderRadius.circular(5)),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: const Text(
                            'Virement bancaire',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 40, right: 40, top: 10, bottom: 10),
                          child: Text(
                              "Montant a transferer :${montantEuro}Euro \nIBAN:$iban_bank \nBIC:$bank_bic \nNom:$bank_nom Domiciliation:$bank_domiciliation \nREFERENCE:$reference \nDATE: ${DateTime.now()}",
                              style: const TextStyle(color: Colors.white)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.circle_notifications_rounded,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Text(
                                    'NB:Veuillez mettre dans la référence de transfert du virement ou versement sur le compte de CPAY: REFERENCE + Montant MGA + Nom + Contact',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
