import 'package:cpay/pages/authentification.dart';
import 'package:flutter/material.dart';
import 'package:cpay/items/Article.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  int currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _ktabpage = <Widget>[
      //Container(color: Colors.red,),
      const listdesArticles(),
      Container(color: Colors.green),
      Container(color: Colors.red),
      Container(
        color: Colors.orange,
      ),
    ];
    final _kBottomNavBar = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'accueil'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined), label: 'achat en ligne'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.local_offer_outlined), label: 'tarifs'),
      const BottomNavigationBarItem(icon: Icon(Icons.api), label: 'apis'),
    ];

    assert(_ktabpage.length == _kBottomNavBar.length);
    final botomNavBar = BottomNavigationBar(
      items: _kBottomNavBar,
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
            // Action à effectuer lorsque l'icône de gauche est cliquée
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.login,
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
      body: _ktabpage[currentTabIndex],
      bottomNavigationBar: botomNavBar,
    );
  }
}
