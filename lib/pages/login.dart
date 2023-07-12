import 'package:flutter/material.dart';

import '../items/TextFieldPreuse.dart';

class Login extends StatelessWidget {
  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: <Widget>[
              //la photo de logo cpay==========================================================
              Align(
                alignment: const Alignment(0, -0.7),
                child: Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Image.asset(('lib/photos/285-min.png')),
                  ),
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
                              'welcome to',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'c-Pay',
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
                        prefixIco: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        sufixICO: Icon(null),
                        label: "User Name",
                        typeWord: TextCapitalization.words,
                      ),
                      const TextFieldPreuse(
                        obscur: true,
                        prefixIco: Icon(
                          Icons.security,
                          color: Colors.white,
                        ),
                        sufixICO: Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                        ),
                        label: "Password",
                        typeWord: TextCapitalization.words,
                      ),
                      Container(
                        //color: Colors.red,
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          child: const Text(
                            textAlign: TextAlign.center,
                            'Sing in',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF6334A9),
                              fontFamily: 'PlusJakartaSans',
                            ),
                          ),
                          onPressed: () => print('connect'),
                        ),
                      ),
                      Container(
                        //color: Colors.red,
                        width: 300,
                        height: 50,
                        child: const Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'OR',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'Sing in with',
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
                        //color: Colors.red,
                        width: 300,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              //color: Colors.green,
                              width: 50,
                              height: 50,
                              child: IconButton(
                                icon: Image.asset(
                                    ('lib/photos/Facebook-logo.png')),
                                onPressed: () => print('log in facebook'),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              //color: Colors.green,
                              width: 50,
                              height: 50,
                              child: IconButton(
                                icon:
                                    Image.asset(('lib/photos/google-logo.png')),
                                onPressed: () => print('log in google'),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              //color: Colors.green,
                              width: 50,
                              height: 50,
                              child: IconButton(
                                icon:
                                    Image.asset(('lib/photos/twiter-logo.png')),
                                onPressed: () => print('log in twiter'),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //============================================================================================
              )
            ],
          );
        },
      ),
    );
  }
}
