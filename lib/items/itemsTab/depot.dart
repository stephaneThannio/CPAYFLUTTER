import 'dart:convert';

import 'package:cpay/items/itemsTab/depotitem.dart';
import 'package:cpay/items/loadinglistview.dart';
import 'package:cpay/pages/plusInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//
class DepotListe extends StatelessWidget {
  const DepotListe(
      {super.key,
      required this.list,
      required this.control,
      required this.loadlist});
//
  final List list;
  final bool loadlist;
  // final Map<String, dynamic> list;
  final ScrollController control;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              controller: control,
              itemCount: list.length,
              itemBuilder: (context, index) => SizedBox(
                  height: 70.spMax,
                  child: GestureDetector(
                    onTap: () {
                      if (list[index]['application'] != "MVOLA") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InfoBnc(
                                      list: List<Map<String, dynamic>>.from(
                                          jsonDecode(
                                              list[index]['application'])),
                                    )));
                      }
                    },
                    child: DepotItem(
                      status: list[index]["status_payment"],
                      date: list[index]["date"],
                      montant: list[index]["montant"],
                      application: list[index]["application"],
                    ),
                  ))),
        ),
        Visibility(
          visible: loadlist,
          child: const SizedBox(height: 10, child: LoadingLisview()),
        )
      ],
    );
  }
}
