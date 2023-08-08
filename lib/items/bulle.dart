import 'package:cpay/items/itemsTab/Showdialog/fairedepot.dart';
import 'package:cpay/items/itemsTab/Showdialog/faireretrait.dart';
import 'package:cpay/pages/depotpage.dart';
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
          SizedBox(
            height: 70,
            width: 70,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 7,
                          blurRadius: 9,
                          offset: Offset(2, 5), // Décalage vertical de l'ombre
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60)),
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PageDepot())),
                        icon: Image.asset('lib/photos/depot.png')),
                  ),
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Depot',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontFamily: 'PlusJakartaSans',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
            width: 70,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 7,
                          blurRadius: 9,
                          offset: Offset(2, 5), // Décalage vertical de l'ombre
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60)),
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PageDepot())),
                        icon: Image.asset('lib/photos/retrait.png')),
                  ),
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'retrait',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontFamily: 'PlusJakartaSans',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
            width: 70,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 7,
                          blurRadius: 9,
                          offset: Offset(2, 5), // Décalage vertical de l'ombre
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60)),
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PageDepot())),
                        icon: Image.asset('lib/photos/transfert.png')),
                  ),
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'transfert',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontFamily: 'PlusJakartaSans',
                  ),
                ),
              ],
            ),
          ),
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
