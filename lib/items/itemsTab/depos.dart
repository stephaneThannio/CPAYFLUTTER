import 'package:cpay/items/itemsTab/depotitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/depottransaction.dart';

class Depot extends StatelessWidget {
  const Depot({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: depotTransaction.length,
        itemBuilder: (context, index) => SizedBox(
            height: 70.spMax,
            child: DepotItem(depots: depotTransaction[index])));
  }
}
