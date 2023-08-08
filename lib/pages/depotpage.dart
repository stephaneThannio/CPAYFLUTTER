import 'package:flutter/material.dart';

class PageDepot extends StatefulWidget {
  const PageDepot({super.key});

  @override
  State<PageDepot> createState() => _PageDepotState();
}

class _PageDepotState extends State<PageDepot> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenwidth,
          height: screenheight,
          child: Column(
            children: [
              Center(
                child: Container(
                  width: screenwidth,
                  height: screenheight * 0.6,
                  decoration: BoxDecoration(
                      color: const Color(0xFF6334A9),
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Faire un depot',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                              Text(
                                'Veillez remplir le formulaire',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          width: double.infinity,
                          height: 70,
                          child: Row(
                            children: [
                              IconButton(
                                  icon: const Icon(
                                    Icons.credit_card,
                                    size: 60,
                                    color: Color(0xFF6334A9),
                                  ),
                                  onPressed: () => Null),
                              const Expanded(
                                  child: TextField(
                                keyboardType: TextInputType.text,
                                maxLines: 1,
                                decoration: InputDecoration.collapsed(
                                    hoverColor: Colors.red,
                                    hintText: "IBAN CPAY DU DESTINATAIRE"),
                              ))
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          width: double.infinity,
                          height: 70,
                          child: Row(
                            children: [
                              IconButton(
                                  icon: const Icon(
                                    Icons.money,
                                    size: 60,
                                    color: Color(0xFF6334A9),
                                  ),
                                  onPressed: () => Null),
                              const Expanded(
                                  child: TextField(
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                decoration: InputDecoration.collapsed(
                                    hintText: "Montant"),
                              ))
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          width: double.infinity,
                          height: 70,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () => Null,
                                icon: const Icon(
                                  Icons.phone,
                                  size: 60,
                                  color: Color(0xFF6334A9),
                                ),
                              ),
                              const Expanded(
                                  child: TextField(
                                keyboardType: TextInputType.phone,
                                maxLines: 1,
                                decoration: InputDecoration.collapsed(
                                    hintText: "Telephone"),
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'METHODE DE PAYEMENT',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6334A9),
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Card(
                                elevation: 6,
                                child: Image.asset('lib/photos/mvola.webp'),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Card(
                                elevation: 6,
                                child:
                                    Image.asset('lib/photos/banktransfert.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
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
                            onPressed: () => {}),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}