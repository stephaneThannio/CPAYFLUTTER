import 'package:flutter/material.dart';
import '../../items/bulle.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount>
    with SingleTickerProviderStateMixin {
  bool isvisible = false;
  setVisibleBulle() {
    if (!isvisible) {
      setState(() {
        isvisible = true;
        _animcontroller.forward();
      });
    } else {
      setState(() {
        isvisible = false;
        _animcontroller.reverse();
      });
    }
  }

  late AnimationController _animcontroller;
  //late Animation<double> _scaleAnimation;
  @override
  void initState() {
    super.initState();
    _animcontroller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _animcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("welcome user"),
        leading: const Icon(Icons.menu),
      ),
      body: Container(
        color: Colors.red,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: const Alignment(0.9, -1),
              child: Container(
                color: Colors.yellow,
                height: 50,
                width: 50,
              ),
            ),
            Align(
              alignment: Alignment(-0.9, -1),
              child: Container(
                color: Colors.green,
                height: 50,
                width: 100,
              ),
            ),
            Align(
              alignment: const Alignment(0.7, 0.7),
              child: ScaleTransition(
                scale: _animcontroller,
                child: Visibility(
                    visible: isvisible, child: const bulleRetraitVers()),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6334A9),
        onPressed: () {
          setVisibleBulle();
        },
        child: const Icon(
          Icons.payment,
          color: Colors.white,
        ),
      ),
    );
  }
}
