import 'package:flutter/material.dart';

class Authentification extends StatefulWidget {
  const Authentification({super.key});

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6334A9),
      body: Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0, -0.7),
              child: Container(
                child: Center(
                  child: Image.asset(('lib/photos/285-min.png')),
                ),

                //color: Colors.red,
                width: 200,
                height: 200,
              ),
            ),
            Align(
              alignment: Alignment(0.04, -0.29),
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
              alignment: Alignment(0, 1),
              child: Container(
                color: Colors.yellow,
                height: 440,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Colors.red,
                      width: 300,
                      height: 50,
                      child: const TextField(
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            fillColor: Color(0xFF6334A9),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60))),
                            filled: true,
                            labelText: 'User Name',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      width: 300,
                      height: 50,
                    ),
                    Container(
                      color: Colors.red,
                      width: 300,
                      height: 50,
                    ),
                    Container(
                      color: Colors.red,
                      width: 300,
                      height: 50,
                    ),
                    Container(
                      color: Colors.red,
                      width: 300,
                      height: 50,
                    ),
                    Container(
                      color: Colors.red,
                      width: 300,
                      height: 50,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
