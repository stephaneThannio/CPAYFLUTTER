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

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: const Color(0xFF6334A9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            child: const Center(
              child: Row(
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
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
    );
  }
}
