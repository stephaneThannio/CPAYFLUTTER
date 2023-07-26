//import 'dart:ffi';

//import 'package:animator/animator.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cpay/models/user.dart';
import 'package:cpay/pages/authentification.dart';
import 'package:cpay/pages/mes_articles.dart';
import 'package:cpay/pages/qr_code_page.dart';
//import 'package:cpay/pages/login.dart';
//import 'package:cpay/pages/confirmation.dart';
import 'package:flutter/material.dart';
//import 'package:cpay/items/Article.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quickalert/quickalert.dart';

import '../items/bulle.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> with SingleTickerProviderStateMixin {
  //late ConnectivityResult _connectionStatus;
  //late Duration dur;
  //final Connectivity _connectivity = Connectivity();
  int currentTabIndex = 0;
//=======================SnackBar============================================================================
  // void showSnackBar(ConnectivityResult status) {
  //   final snackBar = SnackBar(
  //     content: Container(
  //       padding: const EdgeInsets.all(16),
  //       height: 90,
  //       decoration: BoxDecoration(
  //         borderRadius: const BorderRadius.all(Radius.circular(20)),
  //         color: Color(
  //             status == ConnectivityResult.none ? 0xFFC72C41 : 0xFF5B931C),
  //       ),
  //       child: Column(
  //         children: [
  //           Text(
  //             status == ConnectivityResult.none ? 'Erreur' : 'OK',
  //             style: const TextStyle(fontSize: 18, color: Colors.white),
  //           ),
  //           Text(
  //               status == ConnectivityResult.none
  //                   ? 'veillez activer votre connection.'
  //                   : 'La connexion est retablis.',
  //               style: const TextStyle(fontSize: 12, color: Colors.white)),
  //         ],
  //       ),
  //     ),
  //     margin: const EdgeInsets.only(
  //       bottom: 550,
  //       left: 10,
  //       right: 10,
  //     ),
  //     behavior: SnackBarBehavior.floating,
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  // Future<void> initConnectivity() async {
  //   final ConnectivityResult result = await _connectivity.checkConnectivity();
  //   setState(() {
  //     _connectionStatus = result;
  //   });
  //   _connectivity.onConnectivityChanged.listen((ConnectivityResult status) {
  //     setState(() {
  //       _connectionStatus = status;
  //     });
  //     showSnackBar(_connectionStatus);
  //   });
  // }

//========================Snackbar=========================================
//=========================Titre de page control================================================
  bool log = true;
  String titre = "Articles";
  void defTitle(int val) {
    if (val == 0) {
      setState(() {
        titre = "Articles";
      });
    } else if (val == 1) {
      setState(() {
        titre = "Achats";
      });
    } else if (val == 2) {
      setState(() {
        titre = "Transactions";
      });
    } else if (val == 3) {
      setState(() {
        titre = "Achat via code Qr";
      });
    }
  }
//===========================Titre de page control===================================================================================

//==============================Alert=======================================================================
  void Alert(String titreAlert, String TextAlert, QuickAlertType typeAlert,
      VoidCallback func) {
    QuickAlert.show(
      context: context,
      type: typeAlert,
      title: titreAlert,
      text: TextAlert,
      onConfirmBtnTap: func,
      confirmBtnColor: const Color(0xFF6334A9),
    );
  }

  //=====================Alert=======================================================================================
  //====================controle de visibility==============================
  late AnimationController _animcontroller;
  bool isvisible = false;
  setVisibleBulle() {
    setState(() {
      isvisible = !isvisible;
    });
  }

  bool visibledepar = true;

  visibledep() {
    if (visibledepar) {
      setState(() {
        visibledepar = false;
      });
    }
  }

  visibledep2() {
    if (!visibledepar) {
      setState(() {
        visibledepar = true;
      });
    }
    setcontrol();
  }

  setcontrol() {
    if (isvisible) {
      _animcontroller.forward();
    } else {
      _animcontroller.reverse();
    }
  }

  //======================InitState======================================================================================
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //initConnectivity();
    User.getUser();
    visibledep();
    _animcontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animcontroller.dispose();
    super.dispose();
  }

//============================Widget=======================================================================
  @override
  Widget build(BuildContext context) {
    final ktabpage = <Widget>[
      //Container(color: Colors.red,),
      // const listdesArticles(),
      const MesArticles(),
      Container(color: Colors.green),
      Container(color: Colors.red),
      const QrCode(),
    ];
    final kBottomNavBar = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ACCUEIL'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined), label: 'ACHATS'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.send_to_mobile_outlined), label: 'TRANSACTIONS'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.qr_code), label: 'SCAN QR'),
    ];

    assert(ktabpage.length == kBottomNavBar.length);
    final botomNavBar = BottomNavigationBar(
      items: kBottomNavBar,
      currentIndex: currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        if (User.sessionUser != null) {
          setState(() {
            currentTabIndex = index;
          });
          defTitle(index);
        } else {
          Alert("Authentification requis", "Veuillez vous connecter.",
              QuickAlertType.error, () {
            Navigator.pop(context, 'Se connecter');
          });
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            textAlign: TextAlign.center,
            titre,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'PlusJakartaSans',
            ),
          ),
        ),
        // leading: Container(
        //   decoration: BoxDecoration(
        //       color: Colors.white, borderRadius: BorderRadius.circular(60)),
        // ),
        leading: IconButton(
          icon: Image.asset(('lib/photos/285-min.png')),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MesArticles()));

            // Action à effectuer lorsque l'icône de gauche est cliquée
          },
        ),
        actions: [
          User.sessionUser == null && log
              ? IconButton(
                  icon: const Icon(
                    Icons.account_circle_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Action à effectuer lorsque l'icône de droite est cliquée
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Authentification()));
                  },
                )
              : User.sessionUser == null && !log
                  ? IconButton(
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Action à effectuer lorsque l'icône de droite est cliquée
                        Alert("Deconnexion", "Voulez vous vraiment deconnecter",
                            QuickAlertType.confirm, () {
                          User.logOut();
                          Navigator.pop(context);
                          setState(() {
                            log = true;
                          });
                        });
                      },
                    )
                  : IconButton(
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Action à effectuer lorsque l'icône de droite est cliquée
                        Alert("Deconnexion", "Voulez vous vraiment deconnecter",
                            QuickAlertType.confirm, () {
                          User.logOut();
                          Navigator.pop(context);
                          setState(() {
                            log = true;
                          });
                        });
                      },
                    ),
        ],
        backgroundColor: const Color(0xFF6334A9),
      ),
      body: Stack(
        children: [
          ktabpage[currentTabIndex],
          Visibility(
            visible: visibledepar,
            child: const bulleRetraitVers()
                .animate(
                  controller: _animcontroller,
                )
                .scale(
                    duration: Duration(milliseconds: 100),
                    alignment: const Alignment(0.8, 0.8)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6334A9),
        onPressed: () {
          setVisibleBulle();
          visibledep2();
          //setcontrol();
          print(visibledepar);
        },
        child: const Icon(
          Icons.payment,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: botomNavBar,
    );
  }
}
