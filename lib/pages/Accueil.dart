import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cpay/models/user.dart';
import 'package:cpay/pages/authentification.dart';
//import 'package:cpay/pages/confirmation.dart';
import 'package:flutter/material.dart';
import 'package:cpay/items/Article.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  late ConnectivityResult _connectionStatus;
  late Duration dur;
  final Connectivity _connectivity = Connectivity();
  int currentTabIndex = 0;
  void showSnackBar(ConnectivityResult status) {
    final snackBar = SnackBar(
      // duration: status == ConnectivityResult.none
      //     ? Duration(days: 365)
      //     : Duration.zero,
      content: Container(
        padding: const EdgeInsets.all(16),
        height: 90,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Color(
              status == ConnectivityResult.none ? 0xFFC72C41 : 0xFF5B931C),
        ),
        child: Column(
          children: [
            Text(
              status == ConnectivityResult.none ? 'Erreur' : 'OK',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
                status == ConnectivityResult.none
                    ? 'veillez activer votre connection.'
                    : 'La connexion est retablis.',
                style: const TextStyle(fontSize: 12, color: Colors.white)),
          ],
        ),
      ),
      margin: const EdgeInsets.only(
        bottom: 550,
        left: 10,
        right: 10,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
      showSnackBar(_connectionStatus);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initConnectivity();
    User.getUser();
  }

  @override
  Widget build(BuildContext context) {
    final ktabpage = <Widget>[
      //Container(color: Colors.red,),
      const listdesArticles(),
      Container(color: Colors.green),
      Container(color: Colors.red),
      Container(
        color: Colors.orange,
      ),
    ];
    final kBottomNavBar = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'accueil'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined), label: 'mes achats'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.send_to_mobile_outlined), label: 'mes transaction'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.qr_code), label: 'achat via QR code'),
    ];

    assert(ktabpage.length == kBottomNavBar.length);
    final botomNavBar = BottomNavigationBar(
      items: kBottomNavBar,
      currentIndex: currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            textAlign: TextAlign.center,
            'Articles:',
            style: TextStyle(
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
            print(User.sessionUser!.telephone);

            // Action à effectuer lorsque l'icône de gauche est cliquée
          },
        ),
        actions: [
          IconButton(
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
          ),
        ],
        backgroundColor: const Color(0xFF6334A9),
      ),
      body: ktabpage[currentTabIndex],
      bottomNavigationBar: botomNavBar,
    );
  }
}
