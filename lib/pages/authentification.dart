import 'package:cpay/pages/login.dart';
import 'package:flutter/material.dart';

import 'createAcount.dart';

class Authentification extends StatefulWidget {
  const Authentification({super.key});

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  bool page = true;
  setpage() {
    if (page) {
      setState(() {
        page = false;
      });
    } else {
      setState(() {
        page = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF6334A9),
        body: Stack(
          children: <Widget>[
            Align(
              alignment:
                  page ? const Alignment(0, 0.8) : const Alignment(0, 0.9),
              child: SizedBox(
                //color: Colors.red,
                width: 140,
                height: 25,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6334A9),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                                width: 1, color: Colors.white))),
                    child: page
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                'S\'inscrire',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          )
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                'Se connecter',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                            ],
                          ),
                    onPressed: () => {setpage()}),
              ),
            ),
            page ? const Login() : const CreateAccount(),
          ],
        ));
  }
}
