import 'package:cpay/items/itemsTab/achatapi.dart';
import 'package:cpay/items/itemsTab/depos.dart';
import 'package:cpay/items/itemsTab/retrait.dart';
import 'package:cpay/items/itemsTab/virement.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    final tabpage = <Widget>[
      const Depot(),
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
        appBar: AppBar(
          leading: const Icon(Icons.person_outline),
          actions: [
            Text(User.sessionUser!.iban),
            const SizedBox(
              width: 150,
            ),
            Text('Solde: '),
            Text('180000 MGA')
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              color: Color(0xFF6334A9),
            ),
            labelColor: Colors.white,
            tabs: buttonTop,
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: tabpage,
        ),
      ),
    );
  }
}
