import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'achatapiitem.dart';

//
class AchatApis extends StatelessWidget {
  const AchatApis({super.key, required this.list, required this.control});
//
  final List list;
  // final Map<String, dynamic> list;
  final ScrollController control;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: control,
        itemCount: list.length,
        itemBuilder: (context, index) => SizedBox(
            height: 70.spMax,
            child: AchatApisItem(
              status: list[index]["status_payment"],
              date: list[index]["date"],
              montant: list[index]["montant"],
              info: list[index]["infos"],
            )));
  }
}
