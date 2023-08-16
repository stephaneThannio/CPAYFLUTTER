import 'package:cpay/items/itemsTab/depotitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DepotListe extends StatelessWidget {
  const DepotListe({
    super.key,
    required this.list,
  });

  final Map<String, dynamic> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list['depot'].length,
        itemBuilder: (context, index) => SizedBox(
            height: 70.spMax,
            child: DepotItem(
              status: list['depot'][index]["status_payment"],
              date: list['depot'][index]["date"],
              montant: list['depot'][index]["montant"],
              application: list['depot'][index]["application"],
            )));
  }
}
