import 'package:cpay/items/itemsTab/virementitem.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//
class Virement extends StatelessWidget {
  const Virement({super.key, required this.list, required this.control});
//
  final List list;

  final ScrollController control;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: control,
        itemCount: list.length,
        itemBuilder: (context, index) => SizedBox(
            height: 70.spMax,
            child: VirementItem(
              status: list[index]["status_payment"],
              date: list[index]["date"],
              montant: list[index]["montant"],
              info: list[index]["infos"],
            )));
  }
}
