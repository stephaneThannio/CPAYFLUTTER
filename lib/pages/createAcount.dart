import 'package:flutter/material.dart';

import '../items/TextFieldPreuse.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          //la photo de logo cpay==========================================================
          Align(
            alignment: const Alignment(0, -0.7),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),

              width: 150,
              height: 150,
              child: const Center(
                child: Icon(
                  Icons.person_outline_sharp,
                  size: 100,
                  color: Color(0xFF6334A9),
                ),
              ),
              // child: Center(
              //   child: Image.asset(('lib/photos/285-min.png')),
              // ),
            ),
          ),
          //l'ombre======================================================
          Align(
            alignment: const Alignment(0.04, -0.29),
            child: Container(
              decoration: BoxDecoration(
                //color: Colors.black.withOpacity(0.1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 4),
                    blurRadius: 20,
                  ),
                ],
              ),
              width: 120,
              height: 30,
            ),
          ),
          Align(
            alignment: Alignment(0, 0.9),
            child: Container(
              //container qui englobe les formulaire==========================================
              //color: Colors.yellow,
              height: 440,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    //color: Colors.red,
                    width: 300,
                    height: 50,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          'Create',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'ACCOUNT',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const TextFieldPreuse(
                    obscur: false,
                    prefixIco: Icon(null),
                    sufixICO: Icon(null),
                    label: "your Name",
                    typeWord: TextCapitalization.words,
                  ),
                  const TextFieldPreuse(
                    obscur: false,
                    prefixIco: Icon(null),
                    sufixICO: Icon(null),
                    label: "Your email",
                    typeWord: TextCapitalization.words,
                  ),
                  Container(
                    //color: Colors.red,
                    width: 300,
                    height: 50,
                    child: const TextFieldPreuse(
                      obscur: true,
                      prefixIco: Icon(null),
                      sufixICO: Icon(
                        Icons.check_sharp,
                        color: Colors.white,
                      ),
                      label: "Your password",
                      typeWord: TextCapitalization.words,
                    ),
                  ),
                  Container(
                    //color: Colors.red,
                    width: 300,
                    height: 50,
                    child: const TextFieldPreuse(
                      obscur: true,
                      prefixIco: Icon(null),
                      sufixICO: Icon(
                        Icons.check_sharp,
                        color: Colors.white,
                      ),
                      label: "Confirm your password",
                      typeWord: TextCapitalization.words,
                    ),
                  ),
                  Container(
                    //color: Colors.red,
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      child: const Text(
                        textAlign: TextAlign.center,
                        'Valider',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF6334A9),
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                      onPressed: () => print('Create Acoount'),
                    ),
                  )
                ],
              ),
            ),
            //============================================================================================
          )
        ],
      ),
    );
  }
}
