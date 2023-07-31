import 'package:flutter/material.dart';

class Contentdepotdialog extends StatefulWidget {
  const Contentdepotdialog({super.key});

  @override
  State<Contentdepotdialog> createState() => _ContentdepotdialogState();
}

class _ContentdepotdialogState extends State<Contentdepotdialog> {
  @override
  Widget build(BuildContext context) {
    final tabpage = <Widget>[
      const Center(child: Text('Depots')),
      const Center(child: Text('Virement')),
    ];
    final buttonTop = <Tab>[
      const Tab(
        text: "Mvola",
      ),
      const Tab(
        text: "Banctransfert",
      ),
    ];

    //assert(tabpage.length == buttonTop.length);
    return DefaultTabController(
      length: tabpage.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('faire un depot'),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              color: Color(0xFF6334A9),
            ),
            labelColor: Colors.white,

            //splashBorderRadius: BorderRadius.circular(20),
            //overlayColor: _buttonOverlayColor(),
            tabs: buttonTop,
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: tabpage,
        ),
      ),
    );
  }
}
