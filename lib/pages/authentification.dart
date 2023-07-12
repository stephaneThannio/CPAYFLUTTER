import 'package:cpay/pages/login.dart';
import 'package:flutter/material.dart';

import 'createAcount.dart';

class Authentification extends StatefulWidget {
  const Authentification({super.key});

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6334A9),
      body: DefaultTabController(
          length: 2,
          child: Builder(
              builder: (BuildContext context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: TabBarView(
                            children: <Widget>[
                              Login(),
                              CreateAccount(),
                              // Container(
                              //   color: Colors.amber,
                              // )
                            ],
                          ),
                        )
                      ],
                    ),
                  ))),
    );
  }
}
