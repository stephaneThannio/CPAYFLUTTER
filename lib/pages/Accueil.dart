//import 'dart:ffi';

//import 'package:animator/animator.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cpay/items/cardArticle.dart';

//import 'package:cpay/items/cardArticle.dart';
import 'package:cpay/models/user.dart';
import 'package:cpay/pages/authentification.dart';
import 'package:cpay/pages/depotpage.dart';
import 'package:cpay/pages/mes_articles.dart';
import 'package:cpay/pages/qr_code_page.dart';
import 'package:cpay/pages/splashscreen.dart';
//import 'package:cpay/pages/splashscreen.dart';
import 'package:cpay/pages/transaction.dart';
//import 'package:cpay/pages/login.dart';
//import 'package:cpay/pages/confirmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:cpay/items/Article.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/quickalert.dart';

import '../items/bulle.dart';
import '../items/itemsTab/Showdialog/fairedepot.dart';
import '../models/articles.dart';

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
//=======================SnackBar============================================================================

  notifConnection(ConnectivityResult status) {
    if (status == ConnectivityResult.none) {
      fToast.showToast(
          child: notificatinConnectionDesabled,
          toastDuration: const Duration(days: 365),
          gravity: ToastGravity.TOP);
    } else {
      fToast.removeQueuedCustomToasts();
      fToast.showToast(
          child: notificatinConnectionEnabled,
          toastDuration: const Duration(seconds: 2),
          gravity: ToastGravity.TOP);
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
      notifConnection(_connectionStatus);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifConnection(_connectionStatus);
    });
  }

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
  void alert(String titreAlert, String textAlert, String comfirmText,
      QuickAlertType typeAlert, VoidCallback func) {
    QuickAlert.show(
      confirmBtnText: comfirmText,
      context: context,
      type: typeAlert,
      title: titreAlert,
      text: textAlert,
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
      setState(() {
        visibledepar = false;
      });
    }
  }

  //======================InitState======================================================================================
  late FToast fToast;
  late Article article;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
    initConnectivity();
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

  Future<void> dialogadepot() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Dodeposit();
        });
  }

  ontabBullButton() {
    setVisibleBulle();
    visibledep2();
  }

  goTodepot() {
    print('HELLO');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const PageDepot()));
  }

//============================Widget=======================================================================
  @override
  Widget build(BuildContext context) {
    final ktabpage = <Widget>[
      //Container(color: Colors.red,),
      // const listdesArticles(),
      const MesArticles(),
      Container(color: Colors.green),
      const Transaction(),
      //Container(color: Colors.red),
      const QrCode(),
    ];
    final kBottomNavBar = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 20.0.sp,
          ),
          label: 'ACCUEIL'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart_outlined,
            size: 20.0.sp,
          ),
          label: 'TRADING'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.send_to_mobile_outlined,
            size: 20.0.sp,
          ),
          label: 'MON COMPTE'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.qr_code,
            size: 20.0.sp,
          ),
          label: 'SCAN QR'),
    ];

    assert(ktabpage.length == kBottomNavBar.length);
    final botomNavBar = BottomNavigationBar(
      items: kBottomNavBar,
      iconSize: 20.0.sp,
      selectedFontSize: 12.0.sp,
      unselectedFontSize: 10.0.sp,
      currentIndex: currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        if (User.sessionUser != null) {
          setState(() {
            currentTabIndex = index;
          });
          defTitle(index);
        } else {
          alert("Authentification requis", "Veuillez vous connecter.",
              "Se Connecter", QuickAlertType.info, () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Authentification()));
          });
        }
      },
    );
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              textAlign: TextAlign.center,
              titre,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'PlusJakartaSans',
              ),
            ),
          ),
          leading: IconButton(
            icon: Image(
              width: 30.sp,
              height: 30.sp,
              image: AssetImage('lib/photos/285-min.png'),
            ),
            // iconSize: 200,
            // icon: Image.asset(
            //     width: 200.w, height: 50.h, ('lib/photos/285-min.png')),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Splashscreen()));
            },
          ),
          actions: [
            User.sessionUser == null && log
                ? IconButton(
                    icon: Icon(
                      size: 20.sp,
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
                        icon: Icon(
                          size: 20.sp,
                          Icons.logout,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Action à effectuer lorsque l'icône de droite est cliquée
                          alert(
                              "Deconnexion",
                              "Voulez vous vraiment deconnecter",
                              "Deconnexion",
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
                          alert(
                              "Deconnexion",
                              "Voulez vous vraiment deconnecter",
                              "Deconnexion",
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
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                    ))
                .animate(
                  controller: _animcontroller,
                )
                .fade(
                  duration: const Duration(milliseconds: 100),
                ),
            Visibility(
              visible: visibledepar,
              child: Align(
                alignment: const Alignment(1, 0.6),
                child: SizedBox(
                  height: 300.h,
                  width: 70.w,
                  child: BulleRetraitVers(
                    func: () => ontabBullButton(),
                  )
                      .animate(
                        controller: _animcontroller,
                      )
                      .scaleY(
                          duration: const Duration(milliseconds: 100),
                          alignment: const Alignment(1, 1)),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: SizedBox(
          height: 50.sp,
          width: 50.sp,
          child: FloatingActionButton(
            backgroundColor: const Color(0xFF6334A9),
            onPressed: () {
              setVisibleBulle();
              visibledep2();
            },
            child: Icon(
              size: 25.sp,
              Icons.payment,
              color: Colors.white,
            ),
          ),
        ),
        bottomNavigationBar: botomNavBar,
      ),
    );
  }

  Widget notificatinConnectionDesabled = Container(
    padding: EdgeInsets.symmetric(horizontal: 24.0.h, vertical: 12.0.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.red,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.wifi_off_sharp),
        SizedBox(
          width: 12.0.w,
        ),
        const Text('Connexion perdue')
      ],
    ),
  );
  Widget notificatinConnectionEnabled = Container(
    padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 12.0.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.green,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.wifi),
        SizedBox(
          width: 12.0.w,
        ),
        const Text('Connexion retablis')
      ],
    ),
  );
}
