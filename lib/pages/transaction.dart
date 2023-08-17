import 'package:cpay/api/api.dart';
import 'package:cpay/items/itemsTab/achatapi.dart';
import 'package:cpay/items/itemsTab/depos.dart';
//import 'package:cpay/items/itemsTab/depos.dart';
//import 'package:cpay/items/itemsTab/depotitem.dart';
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
  bool loading = false;
  String totalSold = '';
  String totaldepot = '';
  String totalretrait = '';

  Future getdepot() async {
    setState(() {
      loading = true;
    });
    list = await Api.getDepotlist(User.sessionUser!.iban);
    if (list.isNotEmpty) {
      setState(() {
        loading = false;
        totalSold = list['solde'];
        // totaldepot = list['solde'];
        // totalretrait = list['solde'];
      });
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdepot();
  }

  @override
  Widget build(BuildContext context) {
    final tabpage = <Widget>[
      loading
          ? const Loading(
              spincouleur: Color(0xFF6334A9), containcouleur: Colors.white)
          : DepotListe(list: list),
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
                      "iban:",
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
                      leading: const Icon(
                        Icons.arrow_circle_up_outlined,
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
