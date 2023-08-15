import 'package:cpay/api/api.dart';
import 'package:cpay/items/loading.dart';
import 'package:cpay/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickalert/quickalert.dart';

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
  TextEditingController controliban = TextEditingController();
  TextEditingController controlmontant = TextEditingController();
  TextEditingController controlnum = TextEditingController();
  TextEditingController controlibanBNC = TextEditingController();
  TextEditingController controlmontantBNC = TextEditingController();
  String iban = '';
  String montant = '';
  String numero = '';
  String ibanBNC = '';
  String montantBNC = '';
  void alert(
    String titreAlert,
    String textAlert,
    QuickAlertType typeAlert,
  ) {
    QuickAlert.show(
      context: context,
      type: typeAlert,
      title: titreAlert,
      text: textAlert,
      confirmBtnColor: const Color(0xFF6334A9),
    );
  }

  onBouttonMvolatap() {
    setState(() {
      paymenmode = "Mvola";
    });
    setColor();
  }

  onButtonBanktransfertap() {
    setState(() {
      paymenmode = "banc transfert";
    });
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

  coco() {
    iban = controliban.text;
    montant = controlmontant.text;
    numero = controlnum.text;
    print("iban: $iban,montant =$montant,num= $numero");
  }

  afterSucces(var resi) async {
    var req2 = await Api.listenStatus(resi['serverCorrelationId']);
    print(req2);
    if (req2['status'] == "completed") {
      setState(() {
        loading = false;
        alert('Succes', 'felicitation le compte a bien ete crediter ',
            QuickAlertType.success);
      });
    } else if (req2['status'] == "pending") {
      Future.delayed(const Duration(seconds: 1), () {
        afterSucces(resi);
      });
    } else if (req2['status'] == "failed") {
      setState(() {
        loading = false;
        alert("Transaction echouée", "la transaction a été rejetée",
            QuickAlertType.error);
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

    print("iban:$iban,montant:$montant, numero:$numero");
    var res = await Api.faireDepotMvola(iban, montant, numero);
    print(res);
    if (res['status'] == "Success") {
      afterSucces(res);
    } else if (res['status'] == "Warning") {
      setState(() {
        loading = false;
        alert('titreAlert', res['mdata'].toString(), QuickAlertType.warning);
      });
    } else if (res['status'] == "Error") {
      setState(() {
        loading = false;
        alert('titreAlert', res['mdata'].toString(), QuickAlertType.error);
      });
    } else if (res['status'] == "timeOut") {
      setState(() {
        loading = false;
        alert('titreAlert', "erreur du connexion", QuickAlertType.error);
      });
    }
  }

  ifibannotnul() {
    User.getUser();
    if (User.sessionUser != null) {
      setState(() {
        controliban = TextEditingController(text: User.sessionUser!.iban);
        enabled = false;
      });
    } else {
      setState(() {
        controliban = TextEditingController();
        enabled = true;
      });
    }
  }

  //===================================================================
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ifibannotnul();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return loading
        ? Loading(
            alingementmainax: MainAxisAlignment.center,
            titreLoading: "Attente acceptation du paiment",
            contenttext: "verifiez votre telephone",
            spincouleur: Color(0xFF6334A9),
            containcouleur: Colors.white,
            hauteurContainer: screenheight,
          )
        : Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                width: screenwidth,
                height: screenheight,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: screenwidth,
                        height: screenheight * 0.6,
                        decoration: BoxDecoration(
                            color: const Color(0xFF6334A9),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
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
                                      decoration:
                                          const InputDecoration.collapsed(
                                              hintText:
                                                  "IBAN CPAY DU DESTINATAIRE"),
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
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
                                          const InputDecoration.collapsed(
                                              hintText: "Montant MGA"),
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
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
                                      decoration:
                                          const InputDecoration.collapsed(
                                              hintText: "Telephone MVOLA"),
                                    ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              width: double.infinity,
                              height: 100.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                        onpressContinuerMvola(),
                                      }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
