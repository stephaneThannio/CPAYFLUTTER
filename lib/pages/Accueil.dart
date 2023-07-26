//import 'dart:ffi';

//import 'package:animator/animator.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cpay/models/user.dart';
import 'package:cpay/pages/authentification.dart';
import 'package:cpay/pages/mes_articles.dart';
import 'package:cpay/pages/qr_code_page.dart';
//import 'package:cpay/pages/login.dart';
//import 'package:cpay/pages/confirmation.dart';
import 'package:flutter/material.dart';
//import 'package:cpay/items/Article.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/quickalert.dart';

import '../items/bulle.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> with SingleTickerProviderStateMixin {
  late ConnectivityResult _connectionStatus;
  //late Duration dur;
  final Connectivity _connectivity = Connectivity();
  int currentTabIndex = 0;
//=======================Toast============================================================================
  setToast(ConnectivityResult status) {
    if (status == ConnectivityResult.none) {
      fToast.showToast(
        child: toastOffline,
        gravity: ToastGravity.TOP,
        toastDuration: const Duration(days: 365),
      );
    } else {
      fToast.removeQueuedCustomToasts();
      fToast.showToast(
        child: toastOnline,
        gravity: ToastGravity.TOP,
        toastDuration: const Duration(seconds: 2),
      );
    }
  }

  Future<void> initConnectivity() async {
    final ConnectivityResult result = await _connectivity.checkConnectivity();
    setState(() {
      _connectionStatus = result;
    });
    _connectivity.onConnectivityChanged.listen((ConnectivityResult status) {
      setState(() {
        _connectionStatus = status;
      });
      setToast(_connectionStatus);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setToast(_connectionStatus);
    });
  }

//========================Toast=========================================
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
  late FToast fToast;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initConnectivity();
    fToast = FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);
    User.getUser();
    visibledep();
    _animcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
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
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'accueil'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined), label: 'mes achats'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.send_to_mobile_outlined), label: 'mes transactions'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.qr_code), label: 'achat via QR code'),
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
          Alert("Erreur", "Vous devez vous connecter d'abord",
              QuickAlertType.error, () {
            Navigator.pop(context);
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
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const MesArticles()));

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
          fToast.removeCustomToast();
        },
        child: const Icon(
          Icons.payment,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: botomNavBar,
    );
  }

  Widget toastOffline = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.red,
    ),
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.wifi_off_outlined),
        SizedBox(
          width: 12.0,
        ),
        Text("vous n'etes pas connecter"),
      ],
    ),
  );

  Widget toastOnline = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.green,
    ),
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.wifi),
        SizedBox(
          width: 12.0,
        ),
        Text("Connection retablis"),
      ],
    ),
  );
}
