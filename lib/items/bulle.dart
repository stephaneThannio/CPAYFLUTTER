import 'package:cpay/items/itemsTab/Showdialog/fairedepot.dart';
import 'package:cpay/items/itemsTab/Showdialog/faireretrait.dart';
import 'package:flutter/material.dart';

class BulleRetraitVers extends StatelessWidget {
  const BulleRetraitVers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> dialogadepot() async {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return const Dodeposit();
          });
    }

    Future<void> dialogretrait() async {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return const Retireit();
          });
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: const Alignment(0.6, 0.65),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.8),
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: const Offset(0, 6),
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
          height: 180,
          width: 150,
          child: Column(
            children: <Widget>[
              Container(
                height: 70,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color(0xFF6334A9),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        'PAYEMENT',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                    ),
                    Icon(
                      Icons.payment,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                //color: Colors.orange,
                width: 130,
                height: 100,
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xFF6334A9),
                          )),
                      onPressed: () => dialogadepot(),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              'Depot',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xFF6334A9),
                          )),
                      onPressed: () => dialogretrait(),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.money_off,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              'Retrait',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
