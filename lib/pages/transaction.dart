import 'package:cpay/api/api.dart';
import 'package:cpay/items/itemsTab/achatapi.dart';
import 'package:cpay/items/itemsTab/depos.dart';
import 'package:cpay/items/itemsTab/retrait.dart';
import 'package:cpay/items/itemsTab/virement.dart';
import 'package:cpay/items/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/user.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  Map<String, dynamic> list = {};
  List listeee = [];
  Map<String, dynamic> listnext = {};
  bool loading = false;
  String totalSold = '';
  String totaldepot = '';
  String totalretrait = '';
  int page = 1;
  ScrollController scrollController = ScrollController();
  Future getdepot() async {
    setState(() {
      loading = true;
    });
    list = await Api.getDepotlist(User.sessionUser!.iban, page);
    for (int i = 0; i < list['depot'].length; i++) {
      listeee.add(list['depot'][i]);
    }

    if (list.isNotEmpty) {
      setState(() {
        loading = false;
        totalSold = list['solde'];
        page = page + 1;
      });
    }
    //print(listeee[0][0]['date']);
    print(page);
  }

  Future scrolllistner() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      list = await Api.getDepotlist(User.sessionUser!.iban, page);
      for (int i = 0; i < list['depot'].length; i++) {
        if (page <= list["total_page_depot"]) {
          listeee.add(list['depot'][i]);
        }
      }
      setState(() {
        if (page <= list["total_page_depot"]) {
          page = page + 1;
          print(page);
        }
      });
    }
    //   listnext = await Api.getDepotlist(User.sessionUser!.iban, page);
    // }
    // listnext.forEach((key, value) {
    //   list[key] = value;
    // });
    // setState(() {});
    //print(list['depot']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(scrolllistner);
    getdepot();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabpage = <Widget>[
      loading
          ? const Loading(
              spincouleur: Color(0xFF6334A9), containcouleur: Colors.white)
          : DepotListe(list: listeee, control: scrollController),
      const Virement(),
      const AchatApis(),
      const Retrait()
    ];
    final buttonTop = <Tab>[
      const Tab(
        text: "Depot",
      ),
      const Tab(
        text: "Virement",
      ),
      const Tab(
        text: "Achats Api",
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
                        "$totalSold MGA",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ListTile(
                      leading: GestureDetector(
                        onTap: () {
                          print(list.length);
                        },
                        child: const Icon(
                          Icons.arrow_circle_up_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      title: Text(
                        "$totalSold MGA",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF6334A9),
                          fontFamily: 'PlusJakartaSans',
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
                SizedBox(
                  height: 50,
                  width: 150,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ListTile(
                      leading: const Icon(
                        Icons.arrow_circle_down_outlined,
                        color: Colors.grey,
                      ),
                      title: Text(
                        "$totalSold MGA",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF6334A9),
                          fontFamily: 'PlusJakartaSans',
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
                )
              ],
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
