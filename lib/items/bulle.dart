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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 10,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: IconButton(
                      onPressed: null,
                      icon: Image.asset('lib/photos/depot.png')),
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Depot',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontFamily: 'PlusJakartaSans',
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 10,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: IconButton(
                      onPressed: null,
                      icon: Image.asset('lib/photos/retrait.png')),
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Retrait',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontFamily: 'PlusJakartaSans',
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 10,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: IconButton(
                      onPressed: null,
                      icon: Image.asset('lib/photos/transfert.png')),
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Transfert',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontFamily: 'PlusJakartaSans',
                  ),
                ),
              ],
            ),
          )
          // ElevatedButton(
          //   style: ButtonStyle(
          //       shape: MaterialStateProperty.all(
          //         RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10.0),
          //         ),
          //       ),
          //       backgroundColor: MaterialStateProperty.all(
          //         const Color(0xFF6334A9),
          //       )),
          //   onPressed: () => dialogadepot(),
          //   child: const Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Icon(
          //         Icons.add,
          //         color: Colors.white,
          //       ),
          //       Expanded(
          //         child: Text(
          //           textAlign: TextAlign.center,
          //           'Depot',
          //           style: TextStyle(
          //             fontSize: 20,
          //             fontWeight: FontWeight.bold,
          //             color: Colors.white,
          //             fontFamily: 'PlusJakartaSans',
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // ElevatedButton(
          //   style: ButtonStyle(
          //       shape: MaterialStateProperty.all(
          //         RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10.0),
          //         ),
          //       ),
          //       backgroundColor: MaterialStateProperty.all(
          //         const Color(0xFF6334A9),
          //       )),
          //   onPressed: () => dialogretrait(),
          //   child: const Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Icon(
          //         Icons.money_off,
          //         color: Colors.white,
          //       ),
          //       Expanded(
          //         child: Text(
          //           textAlign: TextAlign.center,
          //           'Retrait',
          //           style: TextStyle(
          //             fontSize: 20,
          //             fontWeight: FontWeight.bold,
          //             color: Colors.white,
          //             fontFamily: 'PlusJakartaSans',
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
