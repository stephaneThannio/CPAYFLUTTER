//import 'package:cpay/items/itemsTab/Showdialog/fairedepot.dart';
//import 'package:cpay/items/itemsTab/Showdialog/faireretrait.dart';
import 'package:cpay/pages/depotpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BulleRetraitVers extends StatelessWidget {
  final Function func;
  const BulleRetraitVers({
    super.key,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    // Future<void> dialogadepot() async {
    //   await showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return const Dodeposit();
    //       });
    // }

    // Future<void> dialogretrait() async {
    //   await showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return const Retireit();
    //       });
    // }

    void goTodepot() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const PageDepot()));
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 70.sp,
            width: 70.sp,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 7,
                          blurRadius: 9,
                          offset: const Offset(
                              2, 5), // Décalage vertical de l'ombre
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60.sp)),
                  child: SizedBox(
                    height: 45.sp,
                    width: 45.sp,
                    child: IconButton(
                        onPressed: () {
                          func();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PageDepot()));
                        },
                        icon: Image.asset('lib/photos/depot.png')),
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'DEPOT',
                  style: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontFamily: 'PlusJakartaSans',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70.sp,
            width: 70.sp,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 7,
                          blurRadius: 9,
                          offset: const Offset(
                              2, 5), // Décalage vertical de l'ombre
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60.sp)),
                  child: SizedBox(
                    height: 45.sp,
                    width: 45.sp,
                    child: IconButton(
                        onPressed: () {
                          func();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PageDepot()));
                        },
                        icon: Image.asset('lib/photos/retrait.png')),
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'RETRAIT',
                  style: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontFamily: 'PlusJakartaSans',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70.sp,
            width: 70.sp,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 7,
                          blurRadius: 9,
                          offset: const Offset(
                              2, 5), // Décalage vertical de l'ombre
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60.sp)),
                  child: SizedBox(
                    height: 45.sp,
                    width: 45.sp,
                    child: IconButton(
                        onPressed: () {
                          func();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PageDepot()));
                        },
                        icon: Image.asset('lib/photos/transfert.png')),
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'TRANSFERT',
                  style: TextStyle(
                    fontSize: 8.sp,
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
