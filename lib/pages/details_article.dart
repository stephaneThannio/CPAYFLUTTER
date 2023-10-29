//import 'package:cpay/models/articles.dart';
import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:cpay/api/api.dart';
import 'package:cpay/items/essaidialog.dart';
import 'package:cpay/items/loadingsimple.dart';
import 'package:cpay/models/user.dart';
import 'package:cpay/pages/Accueil.dart';
import 'package:cpay/pages/confirm3dsecure.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sms_autofill/sms_autofill.dart';

class DetaisArticle extends StatefulWidget {
  const DetaisArticle({
    super.key,
    required this.id,
    required this.id_categorie,
    required this.categorie,
    required this.photos,
    required this.designation,
    required this.prix_ticket,
    required this.reference,
    required this.pourcentage,
    required this.date_tirage,
  });
  final String id;
  final String id_categorie;
  final String categorie;
  final String photos;
  final String designation;
  final String prix_ticket;
  final String reference;
  final int pourcentage;
  final String date_tirage;
  @override
  State<DetaisArticle> createState() => _DetaisArticleState();
}

class _DetaisArticleState extends State<DetaisArticle> {
  int ticketsNumber = 0;
  int totalticket = 0;
  bool tapercode = false;
  String totaltickettxt = "0";
  NumberFormat format = NumberFormat("#,###");
  bool achattaper = false;
  plusTickets() {
    setState(() {
      ticketsNumber = ticketsNumber + 1;
    });
  }

  calcultotalticket() {
    setState(() {
      totalticket =
          ticketsNumber * int.parse(widget.prix_ticket.replaceAll(' ', ''));
      totaltickettxt = format.format(totalticket).toString();
    });
  }

  lesTickets() {
    if (ticketsNumber > 0) {
      setState(() {
        ticketsNumber = ticketsNumber - 1;
      });
    } else {
      setState(() {
        ticketsNumber = ticketsNumber - 0;
      });
    }
  }

  TextEditingController nb1 = TextEditingController();
  TextEditingController nb2 = TextEditingController();
  TextEditingController nb3 = TextEditingController();
  TextEditingController nb4 = TextEditingController();
  TextEditingController nb5 = TextEditingController();
  TextEditingController nb6 = TextEditingController();
  TextEditingController nb7 = TextEditingController();
  bool loadingsendcode = false;
  void showalertalert(String type, String titreAlert, String descri,
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

  // void showalert() {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) => writecode(context));
  // }

  afficherwritecode() {
    setState(() {
      tapercode = true;
    });
  }

  sendCode() async {
    setState(() {
      loadingsendcode = true;
    });
    var request = await Api.send3dcode(totalticket.toString());
    if (request != {}) {
      setState(() {
        loadingsendcode = false;
        tapercode = true;
      });

      initSmsListener();
    }
  }

////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
  ///
  ///
  ///
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
      // nb1 = TextEditingController(text: _commingSms[0]);
      // nb2 = TextEditingController(text: _commingSms[1]);
      // nb3 = TextEditingController(text: _commingSms[2]);
      // nb4 = TextEditingController(text: _commingSms[3]);
      // nb5 = TextEditingController(text: _commingSms[4]);
      // nb6 = TextEditingController(text: _commingSms[5]);
      // nb7 = TextEditingController(text: _commingSms[6]);
    });
  }

  ///////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
  ///
  bool loading = false;

  sendrequestvirement(String code) async {
    setState(() {
      loading = true;
    });

    var request =
        await Api.buyTicket(widget.id, code, ticketsNumber.toString());
    if (request != {}) {
      setState(() {
        loading = false;
      });
      if (request["status"] == "success") {
        showalertalert("succes", "felicitation", request["mdata"], "valider",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Accueil()));
        });
      }
    }
  }

  OtpFieldController controlcode = OtpFieldController();
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
  @override
  void dispose() {
    AltSmsAutofill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loadingsendcode
            ? const Loading(spincouleur: Color(0xFF6334A9))
            : (tapercode
                ? writecode(context)
                : Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            //color: Colors.green,
                            height: 320.sp,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(widget.photos)),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              margin: const EdgeInsets.all(20),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 28.sp, right: 28.sp),
                            //color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF6334A9),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 8.sp, left: 8.sp),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'Designation',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                          fontFamily: 'PlusJakartaSans',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  'Tirage dans:',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 30),
                                  //color: Colors.green,
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    widget.designation,
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'PlusJakartaSans',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  //color: Colors.orange,
                                  margin: const EdgeInsets.only(right: 30),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF6334A9)
                                            .withOpacity(0.6),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 30.sp,
                                          right: 30.sp,
                                          top: 5.sp,
                                          bottom: 5.sp),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            size: 23.sp,
                                            Icons.timer_sharp,
                                            color: Colors.black,
                                          ),
                                          Text(
                                            textAlign: TextAlign.center,
                                            '4j',
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                              fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: SingleChildScrollView(
                                child: Card(
                              elevation: 2,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Text(
                                      "Prix:",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'PlusJakartaSans',
                                      ),
                                    ),
                                    trailing: Text(
                                      "${widget.prix_ticket} MGA",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'PlusJakartaSans',
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black54,
                                  ),
                                  ListTile(
                                    leading: Text(
                                      "Total a payer:",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'PlusJakartaSans',
                                      ),
                                    ),
                                    trailing: Text(
                                      "${totaltickettxt.replaceAll(",", " ")} MGA",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'PlusJakartaSans',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        '-',
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'PlusJakartaSans',
                                        ),
                                      ),
                                      onPressed: () =>
                                          {lesTickets(), calcultotalticket()}),
                                  Text(
                                    textAlign: TextAlign.center,
                                    ticketsNumber.toString(),
                                    style: TextStyle(
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontFamily: 'PlusJakartaSans',
                                    ),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        '+',
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'PlusJakartaSans',
                                        ),
                                      ),
                                      onPressed: () =>
                                          {plusTickets(), calcultotalticket()}),
                                ],
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF6334A9)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        //mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.center,
                                            'Acheter',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontFamily: 'PlusJakartaSans',
                                            ),
                                          ),
                                          Icon(
                                            size: 23.sp,
                                            Icons.shopping_cart_rounded,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  onPressed: () => {
                                        sendCode(),
                                        afficherwritecode()
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             const Secure3d()))
                                      }),
                            ],
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                        ],
                      ),
                    ),
                  )));
  }

  Widget writecode(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFF6334A9),
              borderRadius: BorderRadius.circular(20)),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage('lib/photos/gif_alert/warning.gif')),
                      borderRadius: BorderRadius.circular(60.sp)),
                  height: 100.sp,
                  width: 100.sp,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        '3d Secure requis',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          // fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Nous avions  envoyé un code au numero ${User.sessionUser!.telephone.toString().replaceRange(0, 8, '**********')}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          // fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Container(
                          //color: Colors.red,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: OTPTextField(
                            controller: controlcode,
                            spaceBetween: 1,
                            length: 6,
                            width: 50,
                            fieldWidth: 50,
                            style: TextStyle(fontSize: 17),
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.box,
                            onCompleted: (pin) {
                              sendrequestvirement(pin);
                            },
                          ),
                        ),
                      ),
                      // TextField(
                      //   inputFormatters: [LengthLimitingTextInputFormatter(6)],
                      //   controller: controlcode,
                      //   keyboardType: TextInputType.phone,
                      //   maxLines: 1,
                      //   decoration: InputDecoration.collapsed(
                      //       hintStyle: TextStyle(fontSize: 11.sp),
                      //       hintText: "code"),
                      // )
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: FittedBox(
                      //     fit: BoxFit.scaleDown,
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //       children: [
                      //         SizedBox(
                      //           height: 50,
                      //           width: 50,
                      //           child: TextField(
                      //             controller: nb1,
                      //             onChanged: (value) {
                      //               if (value.length == 1) {
                      //                 FocusScope.of(context).nextFocus();
                      //               }
                      //             },
                      //             decoration: const InputDecoration(
                      //                 border: OutlineInputBorder(
                      //                     borderRadius: BorderRadius.all(
                      //                         Radius.circular(10.0)))),
                      //             style: Theme.of(context).textTheme.titleLarge,
                      //             keyboardType: TextInputType.number,
                      //             textAlign: TextAlign.center,
                      //             inputFormatters: [
                      //               LengthLimitingTextInputFormatter(1),
                      //               FilteringTextInputFormatter.digitsOnly
                      //             ],
                      //           ),
                      //         ),
                      //         const SizedBox(
                      //           width: 5,
                      //         ),
                      //         SizedBox(
                      //           height: 50,
                      //           width: 50,
                      //           child: TextField(
                      //             controller: nb2,
                      //             onChanged: (value) {
                      //               if (value.length == 1) {
                      //                 FocusScope.of(context).nextFocus();
                      //               }
                      //             },
                      //             decoration: const InputDecoration(
                      //                 border: OutlineInputBorder(
                      //                     borderRadius: BorderRadius.all(
                      //                         Radius.circular(10.0)))),
                      //             style: Theme.of(context).textTheme.titleLarge,
                      //             keyboardType: TextInputType.number,
                      //             textAlign: TextAlign.center,
                      //             inputFormatters: [
                      //               LengthLimitingTextInputFormatter(1),
                      //               FilteringTextInputFormatter.digitsOnly
                      //             ],
                      //           ),
                      //         ),
                      //         const SizedBox(
                      //           width: 5,
                      //         ),
                      //         SizedBox(
                      //           height: 50,
                      //           width: 50,
                      //           child: TextField(
                      //             controller: nb3,
                      //             onChanged: (value) {
                      //               if (value.length == 1) {
                      //                 FocusScope.of(context).nextFocus();
                      //               }
                      //             },
                      //             decoration: const InputDecoration(
                      //                 border: OutlineInputBorder(
                      //                     borderRadius: BorderRadius.all(
                      //                         Radius.circular(10.0)))),
                      //             style: Theme.of(context).textTheme.titleLarge,
                      //             keyboardType: TextInputType.number,
                      //             textAlign: TextAlign.center,
                      //             inputFormatters: [
                      //               LengthLimitingTextInputFormatter(1),
                      //               FilteringTextInputFormatter.digitsOnly
                      //             ],
                      //           ),
                      //         ),
                      //         const SizedBox(
                      //           width: 5,
                      //         ),
                      //         SizedBox(
                      //           height: 50,
                      //           width: 50,
                      //           child: TextField(
                      //             controller: nb4,
                      //             onChanged: (value) {
                      //               if (value.length == 1) {
                      //                 FocusScope.of(context).nextFocus();
                      //               }
                      //             },
                      //             decoration: const InputDecoration(
                      //                 border: OutlineInputBorder(
                      //                     borderRadius: BorderRadius.all(
                      //                         Radius.circular(10.0)))),
                      //             style: Theme.of(context).textTheme.titleLarge,
                      //             keyboardType: TextInputType.number,
                      //             textAlign: TextAlign.center,
                      //             inputFormatters: [
                      //               LengthLimitingTextInputFormatter(1),
                      //               FilteringTextInputFormatter.digitsOnly
                      //             ],
                      //           ),
                      //         ),
                      //         const SizedBox(
                      //           width: 5,
                      //         ),
                      //         SizedBox(
                      //           height: 50,
                      //           width: 50,
                      //           child: TextField(
                      //             controller: nb5,
                      //             onChanged: (value) {
                      //               if (value.length == 1) {
                      //                 FocusScope.of(context).nextFocus();
                      //               }
                      //             },
                      //             decoration: const InputDecoration(
                      //                 border: OutlineInputBorder(
                      //                     borderRadius: BorderRadius.all(
                      //                         Radius.circular(10.0)))),
                      //             style: Theme.of(context).textTheme.titleLarge,
                      //             keyboardType: TextInputType.number,
                      //             textAlign: TextAlign.center,
                      //             inputFormatters: [
                      //               LengthLimitingTextInputFormatter(1),
                      //               FilteringTextInputFormatter.digitsOnly
                      //             ],
                      //           ),
                      //         ),
                      //         const SizedBox(
                      //           width: 5,
                      //         ),
                      //         SizedBox(
                      //           height: 50,
                      //           width: 50,
                      //           child: TextField(
                      //             controller: nb6,
                      //             onChanged: (value) {
                      //               if (value.length == 1) {
                      //                 FocusScope.of(context).nextFocus();
                      //               }
                      //             },
                      //             decoration: const InputDecoration(
                      //                 border: OutlineInputBorder(
                      //                     borderRadius: BorderRadius.all(
                      //                         Radius.circular(10.0)))),
                      //             style: Theme.of(context).textTheme.titleLarge,
                      //             keyboardType: TextInputType.number,
                      //             textAlign: TextAlign.center,
                      //             inputFormatters: [
                      //               LengthLimitingTextInputFormatter(1),
                      //               FilteringTextInputFormatter.digitsOnly
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 160,
                                height: 50,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        backgroundColor:
                                            const Color(0xFF6334A9)),
                                    onPressed: () {
                                      sendCode();
                                    },
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
                              const SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                width: 160,
                                height: 50,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        backgroundColor:
                                            const Color(0xFF6334A9)),
                                    onPressed: () {
                                      setState(() {
                                        tapercode = false;
                                        loading = false;
                                      });
                                    },
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
