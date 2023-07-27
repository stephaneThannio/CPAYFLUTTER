import 'package:cpay/items/itemsTab/depos.dart';
import 'package:flutter/material.dart';

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
      // const Center(child: Text('Depots')),
      const Center(child: Text('Virement')),
      const Center(child: Text('Achats Api')),
      const Center(child: Text('Retrait')),
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
          leading: Icon(Icons.person_outline),
          actions: [
            Text('CPAY103514814501'),
            SizedBox(
              width: 150,
            ),
            Text('Solde: '),
            Text('180000 MGA')
          ],
          bottom: TabBar(
            tabs: buttonTop,
          ),
        ),
        body: TabBarView(
          children: tabpage,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
