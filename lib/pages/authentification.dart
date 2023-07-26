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
            page ? const Login() : const CreateAccount(),
            Align(
              alignment:
                  page ? const Alignment(0, 0.8) : const Alignment(0, 0.9),
              child: SizedBox(
                //color: Colors.red,
                width: 140,
                height: 25,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: page
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                'Create Account',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                              Icon(
                                Icons.arrow_right_alt_sharp,
                                color: Colors.white,
                              )
                            ],
                          )
                        : const Text(
                            textAlign: TextAlign.center,
                            'Login',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontFamily: 'PlusJakartaSans',
                            ),
                          ),
                    onPressed: () => {setpage()}),
              ),
            ),
          ],
        ));
  }
}
