import 'package:cpay/api/api.dart';
import 'package:cpay/items/error/errorTimeout.dart';
import 'package:cpay/items/essaidialog.dart';
//import 'package:cpay/items/loading.dart';
import 'package:cpay/items/loading_depot.dart';
//import 'package:cpay/items/loadingsimple.dart';
import 'package:cpay/models/user.dart';
import 'package:flutter/material.dart';
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
  bool enabled = false;
  Color mvolaContentColor = Colors.green;
  //Mvola
  TextEditingController controliban = TextEditingController();
  TextEditingController controlmontant = TextEditingController();
  TextEditingController controlnum = TextEditingController();

  String iban = '';
  String montant = '';
  String numero = '';
  bool uneerreur = false;

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
            body: !uneerreur
                ? Formulaire(screenwidth, screenheight)
                : Center(
                    child: PageTimeout(func: () {
                      print('hii');
                    }),
                  ),
          );
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
                        'Retirer de l\'argent',
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
                        'Veillez remplir le formulaire',
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
                          onPressed: () => {print('retrait fait')}),
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
          // Container(
          //   decoration: BoxDecoration(
          //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
          //   width: double.infinity,
          //   height: 70.h,
          //   child: Row(
          //     children: [
          //       IconButton(
          //           icon: const Icon(
          //             Icons.credit_card,
          //             size: 60,
          //             color: Color(0xFF6334A9),
          //           ),
          //           onPressed: () => Null),
          //       Expanded(
          //           child: TextField(
          //         controller: controliban,
          //         enabled: enabled,
          //         keyboardType: TextInputType.text,
          //         maxLines: 1,
          //         decoration: const InputDecoration.collapsed(
          //             hintText: "IBAN CPAY DU DESTINATAIRE"),
          //       ))
          //     ],
          //   ),
          // ),
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
}
