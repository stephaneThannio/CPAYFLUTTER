import 'package:flutter/material.dart';
import 'Article.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _ktabpage = <Widget>[
      //Container(color: Colors.red,),
      const listdesArticles(),
      Container(color: Colors.green),
      Container(
        color: Colors.orange,
      ),
    ];
    final _kBottomNavBar = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.cloud)),
      const BottomNavigationBarItem(icon: Icon(Icons.alarm)),
      const BottomNavigationBarItem(icon: Icon(Icons.forum)),
    ];

    assert(_ktabpage.length == _kBottomNavBar.length);
    final BotomNavBar = BottomNavigationBar(
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
      body: _ktabpage[currentTabIndex],
      bottomNavigationBar: BotomNavBar,
    );
  }
}
