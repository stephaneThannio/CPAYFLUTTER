import 'package:flutter/material.dart';

class FaireDepot {
  String phonesender;
  String phonrecever;
  String modepayment;
  String montant;
  FaireDepot(
      {required this.phonesender,
      required this.phonrecever,
      required this.modepayment,
      required this.montant});
  // static depotdialog(phonesender, phonrecever, modepayment, montant) {
  //   String? selected;
  //   SimpleDialog(
  //     title: Text('Faire un depot'),
  //     children: [
  //       ListTile(
  //         title: Text('mode de payment:'),
  //         trailing: DropdownButton(
  //           value: selected,
  //           hint: const Text('choiseser'),
  //           onChanged: (String? valeur){
  //             if(valeur!=null){
  //               setState
  //             }
  //           },
  //         ),
  //       )
  //     ],
  //   );
  // }
}
