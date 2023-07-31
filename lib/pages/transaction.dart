import 'package:cpay/items/itemsTab/achatapi.dart';
import 'package:cpay/items/itemsTab/depos.dart';
import 'package:cpay/items/itemsTab/retrait.dart';
import 'package:cpay/items/itemsTab/virement.dart';
import 'package:flutter/material.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  // Color _defaultButtonColor = Colors.blue;
  // Color _pressedButtonColor = Colors.green;
  // Color _overlayButtonColor = Colors.red;
  // MaterialStateProperty<Color> _buttonOverlayColor() {
  //   return MaterialStateProperty.resolveWith<Color>(
  //       (Set<MaterialState> states) {
  //     if (states.contains(MaterialState.pressed)) {
  //       return _overlayButtonColor; // Couleur de superposition lorsque le bouton est pressé longuement
  //     } else {
  //       return Colors
  //           .transparent; // Aucune superposition de couleur lorsque le bouton n'est pas pressé longuement
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final tabpage = <Widget>[
      const Depot(),
      const Virement(),
      const AchatApis(),
      const Retrait()
      // const Center(child: Text('Depots')),
      // const Center(child: Text('Virement')),
      //const Center(child: Text('Achats Api')),
      //const Center(child: Text('Retrait')),
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
          actions: const [
            Text('CPAY103514814501'),
            SizedBox(
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

            //splashBorderRadius: BorderRadius.circular(20),
            //overlayColor: _buttonOverlayColor(),
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
