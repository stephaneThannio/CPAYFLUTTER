import 'package:cpay/api/api.dart';
import 'package:cpay/items/itemsTab/achatapi.dart';
import 'package:cpay/items/itemsTab/depos.dart';
import 'package:cpay/items/itemsTab/retrait.dart';
import 'package:cpay/items/itemsTab/virement.dart';
import 'package:cpay/items/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../models/user.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  Map<String, dynamic> listeGlobal = {};
  List listeApis = [];
  List listedepot = [];
  List listvirement = [];
  List listveretrait = [];
  Map<String, dynamic> listnext = {};
  bool loading = false;
  String totalSold = '';
  int sold = 0;
  int entr = 0;
  int sort = 0;
  NumberFormat format = NumberFormat("#,###");
  String soldeafficher = "";
  String soldeafficher2 = "";
  String entree = '';
  String entreeafficher = '';
  String entreeafficher2 = '';
  String sortie = '';
  String sortieafficher = '';
  String sortieafficher2 = '';
  int pagedep = 1;
  int pagevir = 1;
  int pageRTR = 1;
  int pageAPI = 1;
  ScrollController scrollController = ScrollController();
  ScrollController scrollControllerVIR = ScrollController();
  ScrollController scrollControllerRTR = ScrollController();
  ScrollController scrollControllerAPIS = ScrollController();

  //depot===========================================
  Future getdepot() async {
    setState(() {
      loading = true;
    });
    listeGlobal = await Api.getDepotlist(User.sessionUser!.iban, 1);
    for (int i = 0; i < listeGlobal["depot"].length; i++) {
      listedepot.add(listeGlobal["depot"][i]);
    }
    if (listeGlobal.isNotEmpty) {
      if (mounted) {
        setState(() {
          loading = false;
          totalSold = listeGlobal['solde'];
          sold = int.parse(totalSold);
          soldeafficher = (format.format(sold)).toString();
          soldeafficher2 = soldeafficher.replaceAll(',', '  ');
          entree = listeGlobal['entree'];
          entr = int.parse(entree);
          entreeafficher = (format.format(entr)).toString();
          entreeafficher2 = entreeafficher.replaceAll(',', '  ');
          sortie = listeGlobal['sortie'];
          sort = int.parse(sortie);
          sortieafficher = (format.format(sort)).toString();
          sortieafficher2 = sortieafficher.replaceAll(',', '  ');
          pagedep = pagedep + 1;
        });
      }
    }
  }

  Future scrolllistner() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      listeGlobal = await Api.getDepotlist(User.sessionUser!.iban, pagedep);
      for (int i = 0; i < listeGlobal["depot"].length; i++) {
        if (pagedep <= listeGlobal["total_page_depot"]) {
          listedepot.add(listeGlobal["depot"][i]);
        }
      }
      if (mounted) {
        setState(() {
          if (pagedep <= listeGlobal["total_page_depot"]) {
            pagedep = pagedep + 1;
            //print(page);
          }
        });
      }
    }
  }
//====================================================================
//===virement========================================================

  Future getdeVirement() async {
    setState(() {
      loading = true;
    });
    listeGlobal = await Api.getDepotlist(User.sessionUser!.iban, 1);
    for (int i = 0; i < listeGlobal["virement"].length; i++) {
      listvirement.add(listeGlobal["virement"][i]);
    }
    if (listeGlobal.isNotEmpty) {
      setState(() {
        loading = false;
        pagevir = pagevir + 1;
      });
    }
  }

  Future scrolllistnervirement() async {
    if (scrollControllerVIR.position.pixels ==
        scrollControllerVIR.position.maxScrollExtent) {
      listeGlobal = await Api.getDepotlist(User.sessionUser!.iban, pagevir);
      for (int i = 0; i < listeGlobal["virement"].length; i++) {
        if (pagevir <= listeGlobal["total_page_virement"]) {
          listvirement.add(listeGlobal["virement"][i]);
        }
      }
      setState(() {
        if (pagevir <= listeGlobal["total_page_virement"]) {
          pagevir = pagevir + 1;
          //print(page);
        }
      });
    }
  }

//===================================================================
//===Retrait========================================================

  Future getRetrait() async {
    setState(() {
      loading = true;
    });
    listeGlobal = await Api.getDepotlist(User.sessionUser!.iban, 1);
    for (int i = 0; i < listeGlobal["retrait"].length; i++) {
      listveretrait.add(listeGlobal["retrait"][i]);
    }
    if (listeGlobal.isNotEmpty) {
      setState(() {
        loading = false;
        pageRTR = pageRTR + 1;
      });
    }
  }

  Future scrolllistRetrait() async {
    if (scrollControllerRTR.position.pixels ==
        scrollControllerRTR.position.maxScrollExtent) {
      listeGlobal = await Api.getDepotlist(User.sessionUser!.iban, pageRTR);
      for (int i = 0; i < listeGlobal["retrait"].length; i++) {
        if (pageRTR <= listeGlobal["total_page_retrait"]) {
          listveretrait.add(listeGlobal["retrait"][i]);
        }
      }
      setState(() {
        if (pageRTR <= listeGlobal["total_page_retrait"]) {
          pageRTR = pageRTR + 1;
          //print(page);
        }
      });
    }
  }

//===================================================================
//APIS===============================================================
  Future getApis() async {
    setState(() {
      loading = true;
    });
    listeGlobal = await Api.getDepotlist(User.sessionUser!.iban, 1);
    for (int i = 0; i < listeGlobal["api"].length; i++) {
      listeApis.add(listeGlobal["api"][i]);
    }
    if (listeGlobal.isNotEmpty) {
      setState(() {
        loading = false;
        pageAPI = pageAPI + 1;
      });
    }
  }

  Future scrolllistApis() async {
    if (scrollControllerAPIS.position.pixels ==
        scrollControllerAPIS.position.maxScrollExtent) {
      listeGlobal = await Api.getDepotlist(User.sessionUser!.iban, pageAPI);
      for (int i = 0; i < listeGlobal["api"].length; i++) {
        if (pageAPI <= listeGlobal["total_page_api"]) {
          listeApis.add(listeGlobal["api"][i]);
        }
      }
      setState(() {
        if (pageAPI <= listeGlobal["total_page_api"]) {
          pageAPI = pageAPI + 1;
          //print(page);
        }
      });
    }
  }

//=================================================================================
  bool zoomin = true;
  setzoom() {
    setState(() {
      zoomin = !zoomin;
      print(zoomin);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(scrolllistner);
    scrollControllerVIR.addListener(scrolllistnervirement);
    scrollControllerRTR.addListener(scrolllistRetrait);
    scrollControllerAPIS.addListener(scrolllistApis);

    getdepot();
    getdeVirement();
    getRetrait();
    getApis();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
    scrollControllerVIR.dispose();
    scrollControllerRTR.dispose();
    scrollControllerAPIS.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabpage = <Widget>[
      loading
          ? const Loading(
              spincouleur: Color(0xFF6334A9), containcouleur: Colors.white)
          : DepotListe(list: listedepot, control: scrollController),
      loading
          ? const Loading(
              spincouleur: Color(0xFF6334A9), containcouleur: Colors.white)
          : Virement(list: listvirement, control: scrollControllerVIR),
      loading
          ? const Loading(
              spincouleur: Color(0xFF6334A9), containcouleur: Colors.white)
          : AchatApis(list: listeApis, control: scrollControllerAPIS),
      loading
          ? const Loading(
              spincouleur: Color(0xFF6334A9), containcouleur: Colors.white)
          : Retrait(list: listveretrait, control: scrollControllerRTR),
    ];
    final buttonTop = <Tab>[
      const Tab(
        text: "Depot",
      ),
      const Tab(
        text: "Virement",
      ),
      const Tab(
        text: "Apis",
      ),
      const Tab(
        text: "Retrait",
      )
    ];

    assert(tabpage.length == buttonTop.length);
    return DefaultTabController(
      length: tabpage.length,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 100.sp,
              decoration: BoxDecoration(
                  color: const Color(0xFF6334A9),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.sp),
                      bottomRight: Radius.circular(50.sp))),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.sp,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "iban CPAY:",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      User.sessionUser!.iban,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Container(
                      width: 60.sp,
                      height: 1.sp,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    // color: Colors.blue,
                    height: 50.sp,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Solde',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(60.sp)),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFF6334A9),
                      ),
                      //color: Colors.green,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 8.0,
                          bottom: 8.0.sp,
                          left: 30.0.sp,
                          right: 30.0.sp),
                      child: Text(
                        "$soldeafficher2 MGA",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF6334A9),
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50.sp,
                      // width: 150.sp,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ListTile(
                          leading: GestureDetector(
                            onTap: () {
                              setzoom();
                            },
                            child: const Icon(
                              Icons.arrow_circle_up_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          title: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "$entreeafficher2 MGA",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF6334A9),
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          ),
                          subtitle: Text(
                            "Total depot",
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                              fontFamily: 'PlusJakartaSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50.sp,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ListTile(
                          leading: const Icon(
                            Icons.arrow_circle_down_outlined,
                            color: Colors.grey,
                          ),
                          title: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "$sortieafficher2 MGA",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF6334A9),
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          ),
                          subtitle: Text(
                            "Total retrait",
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                              fontFamily: 'PlusJakartaSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width) * 0.8,
              child: TabBar(
                unselectedLabelColor: const Color(0xFF6334A9),
                labelColor: Colors.grey,
                tabs: buttonTop,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Expanded(
              child: Container(
                //color: Colors.red,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: tabpage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
