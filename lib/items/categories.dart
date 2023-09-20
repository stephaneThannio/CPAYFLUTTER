import 'package:cpay/items/itemcategories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categoris extends StatefulWidget {
  final List listcat;
  final Function dosearch;
  final Function fuctionannuler;
  static String filtre = '';
  const Categoris(
      {super.key,
      required this.listcat,
      required this.dosearch,
      required this.fuctionannuler});
  // final String id;
  // final String designation;

  @override
  State<Categoris> createState() => _CategorisState();
}

class _CategorisState extends State<Categoris> {
  bool checkboxvalFourniture = true;
  bool checkboxvalinformatique = true;
  bool checkboxvalMode = true;
  List listcat = [];
  String id = '';
  static String elementrech = '';
  Map<String, String> remplacements = {
    '[': '',
    ']': '',
    ' ': '',
  };
  setfiltre() {
    listcat = Itemcategories.listselect;
    print("selected $listcat");
    elementrech = Itemcategories.listselect
        .toString()
        .replaceAll("[", '')
        .replaceAll(']', '')
        .replaceAll(" ", "");
    Categoris.filtre = elementrech;
  }

  // setfiltre() {
  //   for (int i = 0; i < 3; i++) {
  //     if (i == 0) {
  //       elementrech.replaceAll('[', '');
  //     } else if (i == 1) {
  //       elementrech.replaceAll(']', '');
  //     } else if (i == 3) {
  //       elementrech.replaceAll(' ', '');
  //     }
  //   }
  //   print('elem $elementrech');
  // }

  int place = -1;
  Itemcategories itemcat = Itemcategories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Color(0xFF6334A9),
                ),
                onPressed: () {
                  widget.fuctionannuler();
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.listcat.length,
                itemBuilder: (context, index) {
                  return Itemcategories(
                      designation: widget.listcat[index]['designation'],
                      idcat: widget.listcat[index]['id']);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.grey),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              textAlign: TextAlign.center,
                              'Annuler',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  onPressed: () => {},
                ),
                SizedBox(
                  width: 20.sp,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: const Color(0xFF6334A9)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                textAlign: TextAlign.center,
                                'Valider',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPressed: () {
                      setfiltre();
                      widget.dosearch();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
