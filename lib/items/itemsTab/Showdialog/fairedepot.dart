import 'package:flutter/material.dart';

class Dodeposit extends StatefulWidget {
  const Dodeposit({super.key});

  @override
  State<Dodeposit> createState() => _DodepositState();
}

class _DodepositState extends State<Dodeposit> {
  String? selected;
  bool mode = false;
  setmode() {
    if (mode) {
      setState(() {
        mode = !mode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Faire un depot'),
      children: [
        ListTile(
          title: Text('mode de payment:'),
          trailing: DropdownButton(
            value: selected,
            hint: const Text('Choisir'),
            onChanged: (String? valeur) {
              if (valeur != null) {
                setState(() => selected = valeur);
              }
              setmode();
            },
            items: [
              DropdownMenuItem<String>(
                  value: "Mvola",
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('lib/photos/mvola.webp'),
                  )),
              DropdownMenuItem<String>(
                  value: "banc transfert",
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset('lib/photos/banktransfert.png'),
                  ))
            ],
          ),
        ),
        mode ? depotMvola() : depotBtransfert()
      ],
    );
  }

  Container depotMvola() {
    return Container(
      //color: Colors.amber,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: SizedBox(
              width: 300,
              height: 50,
              child: TextField(
                //textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    icon: const Icon(Icons.person),
                    labelText: 'Identite Cpay du destinatiaire',
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
                //textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20),
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
                //textAlign: TextAlign.center,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 20),
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
                  onPressed: () => {}),
            ),
          ),
        ],
      ),
    );
  }

  Container depotBtransfert() {
    return Container(
      //color: Colors.red,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: SizedBox(
              width: 300,
              height: 50,
              child: TextField(
                //textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 20),
                // style: Theme.of(context).textTheme.headlineMedium,
                decoration: InputDecoration(
                    icon: const Icon(Icons.person),
                    labelText: 'Identite Cpay du destinataire',
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
                //textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 20),
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
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Material(
              borderRadius: BorderRadius.circular(5),
              elevation: 4.0,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Color(0xFF343a40),
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
                        margin: EdgeInsets.only(
                            left: 40, right: 40, top: 10, bottom: 10),
                        child: Text(
                            "Montant a transferer :0 \nIBAN:MG4600006000080000114617359 \nBIC:MCBLMGMGXXX \nNom:The Mauritius Commercial Bank (Madagascar) S.A Domiciliation:Novotel Business Center Alarobia, Route des Hydrocarbures, ANTANANARIVO 101 \nREFERENCE \nDATE: 28/07/2023",
                            style: TextStyle(color: Colors.white)),
                      ),
                      Text(
                          'Veuillez faire un virement sur le compte Bancaire de CPAY avec la référence et le somme indiqué ci-dessus, puis cliquer sur continuer, et votre demande de dépôt sera en attente de validation, dès que votre transaction est valider, la somme sera mis sur votre compte.\n',
                          style: TextStyle(color: Colors.white)),
                      Text(
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
                  onPressed: () => {}),
            ),
          ),
        ],
      ),
    );
  }
}