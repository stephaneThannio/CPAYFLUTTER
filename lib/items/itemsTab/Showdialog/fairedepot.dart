// ignore_for_file: avoid_print
import 'package:cpay/api/api.dart';
import 'package:cpay/items/loading.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class Dodeposit extends StatefulWidget {
  const Dodeposit({super.key});

  @override
  State<Dodeposit> createState() => _DodepositState();
}

class _DodepositState extends State<Dodeposit> {
  TextEditingController controliban = TextEditingController();
  TextEditingController controlmontant = TextEditingController();
  TextEditingController controlnum = TextEditingController();
  TextEditingController controlibanBNC = TextEditingController();
  TextEditingController controlmontantBNC = TextEditingController();

  //TextEditingController controlnum = TextEditingController();
  String iban = '';
  String montant = '';
  String numero = '';
  String ibanBNC = '';
  String montantBNC = '';
  String selected = "Mvola";
  bool mode = true;
  bool loading = false;
  setmode(String val) {
    //print(val);
    if (val == "Mvola") {
      setState(() {
        mode = true;
      });
    } else if (val == "banc transfert") {
      setState(() {
        mode = false;
      });
    }
  }

  void alert(
    String titreAlert,
    String textAlert,
    QuickAlertType typeAlert,
  ) {
    QuickAlert.show(
      context: context,
      type: typeAlert,
      title: titreAlert,
      text: textAlert,
      confirmBtnColor: const Color(0xFF6334A9),
    );
  }

  void retour() {
    Navigator.pop(context);
  }

  Future onpressContinuerMvola() async {
    setState(() {
      loading = true;
    });
    iban = controliban.text;
    montant = controlmontant.text;
    numero = controlnum.text;

    print("iban:$iban,montant:$montant, numero:$numero");
    var res = await Api.faireDepotMvola(iban, montant, numero);
    print(res);
    if (res['status'] == "Success") {
      var req2 = await Api.listenStatus(res['serverCorrelationId']);
      print(req2);
      if (req2['status'] == "completed") {
        setState(() {
          loading = false;
          retour();
          alert('Succes', res['mdata'].toString(), QuickAlertType.success);
        });
      }
    } else if (res['status'] == "Warning") {
      setState(() {
        loading = false;
        alert('titreAlert', res['mdata'].toString(), QuickAlertType.warning);
      });
    } else if (res['status'] == "Error") {
      setState(() {
        loading = false;
        alert('titreAlert', res['mdata'].toString(), QuickAlertType.error);
      });
    }
  }

  Future onpressContinuerBNC() async {
    ibanBNC = controlibanBNC.text;
    montantBNC = controlmontantBNC.text;

    print("iban:$ibanBNC,montant:$montantBNC");
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10), // Vous pouvez ajuster le rayon ici
      ),
      title: const Center(child: Text('Faire un depot')),
      children: [
        loading
            ? const Loading(
                spincouleur: Color(0xFF6334A9),
                containcouleur: Colors.transparent)
            : Column(
                children: [
                  ListTile(
                    title: const Text('mode de payment:'),
                    trailing: DropdownButton(
                      value: selected,
                      //hint: const Text('Choisir'),
                      onChanged: (String? valeur) {
                        if (valeur != null) {
                          setState(() {
                            selected = valeur;
                            //
                          });
                        }
                        setmode(valeur.toString());
                      },
                      items: [
                        DropdownMenuItem<String>(
                            value: "Mvola",
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.asset('lib/photos/mvola.webp'),
                            )),
                        DropdownMenuItem<String>(
                            value: "banc transfert",
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child:
                                  Image.asset('lib/photos/banktransfert.png'),
                            ))
                      ],
                    ),
                  ),
                  mode ? depotMvola() : depotBtransfert()
                  // Stack(
                  //   children: [
                  //     Visibility(visible: mode, child: depotMvola()),
                  //     Visibility(visible: !mode, child: depotBtransfert())
                  //   ],
                  // )
                ],
              )
      ],
    );
  }

  Column depotMvola() {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Center(
          child: SizedBox(
            width: 300,
            height: 50,
            child: TextField(
              controller: controliban,
              //textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  icon: const Icon(Icons.person),
                  labelText: 'IBAN Cpay du destinatiaire',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: SizedBox(
            width: 300,
            height: 50,
            child: TextField(
              controller: controlmontant,
              //textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 20),
              // style: Theme.of(context).textTheme.headlineMedium,
              decoration: InputDecoration(
                  icon: const Icon(Icons.money),
                  labelText: 'Entrer le montant',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        ),
        //const ListTile(title: Text("telephone:")),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: SizedBox(
            width: 300,
            height: 50,
            child: TextField(
              controller: controlnum,
              //textAlign: TextAlign.center,
              keyboardType: TextInputType.phone,
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  icon: const Icon(Icons.phone),
                  labelText: 'Entrer le numero a debiter',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: SizedBox(
            //color: Colors.red,
            width: 200,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6334A9)),
                child: const Text(
                  textAlign: TextAlign.center,
                  'Continuer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontFamily: 'PlusJakartaSans',
                  ),
                ),
                onPressed: () => {onpressContinuerMvola()}),
          ),
        ),
      ],
    );
  }

  Column depotBtransfert() {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Center(
          child: SizedBox(
            width: 300,
            height: 50,
            child: TextField(
              controller: controlibanBNC,
              //textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 20),
              // style: Theme.of(context).textTheme.headlineMedium,
              decoration: InputDecoration(
                  icon: const Icon(Icons.person),
                  labelText: 'IBAN Cpay du destinataire',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        ),
        //const ListTile(title: Text("telephone:")),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: SizedBox(
            width: 300,
            height: 50,
            child: TextField(
              controller: controlmontantBNC,
              //textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  icon: const Icon(Icons.money),
                  labelText: 'Entrer le montant',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),

        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Material(
            borderRadius: BorderRadius.circular(5),
            elevation: 4.0,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  color: const Color(0xFF343a40),
                  borderRadius: BorderRadius.circular(5)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Virement bancaire',
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 40, right: 40, top: 10, bottom: 10),
                      child: const Text(
                          "Montant a transferer :0 \nIBAN:MG4600006000080000114617359 \nBIC:MCBLMGMGXXX \nNom:The Mauritius Commercial Bank (Madagascar) S.A Domiciliation:Novotel Business Center Alarobia, Route des Hydrocarbures, ANTANANARIVO 101 \nREFERENCE \nDATE: 28/07/2023",
                          style: TextStyle(color: Colors.white)),
                    ),
                    const Text(
                        'Veuillez faire un virement sur le compte Bancaire de CPAY avec la référence et le somme indiqué ci-dessus, puis cliquer sur continuer, et votre demande de dépôt sera en attente de validation, dès que votre transaction est valider, la somme sera mis sur votre compte.\n',
                        style: TextStyle(color: Colors.white)),
                    const Text(
                        'NB: Veuillez mettre dans la référence de transfert sur le virement: REFERENCE + Montant MGA + Nom + Contact',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        ),

        const SizedBox(
          height: 20,
        ),
        Center(
          child: SizedBox(
            //color: Colors.red,
            width: 200,
            height: 50,
            child: ElevatedButton(
                child: const Text(
                  textAlign: TextAlign.center,
                  'Continuer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF6334A9),
                    fontFamily: 'PlusJakartaSans',
                  ),
                ),
                onPressed: () => {onpressContinuerBNC()}),
          ),
        ),
      ],
    );
  }
}
