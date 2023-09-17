import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categoris extends StatefulWidget {
  const Categoris({super.key});

  @override
  State<Categoris> createState() => _CategorisState();
}

class _CategorisState extends State<Categoris> {
  bool checkboxvalFourniture = true;
  bool checkboxvalinformatique = true;
  bool checkboxvalMode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: const Color(0xFF6334A9).withOpacity(0.7),
                  child: ListTile(
                    title: Text(
                      textAlign: TextAlign.start,
                      'Fourniture scolaire',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                    trailing: Switch(
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            checkboxvalFourniture = value;
                          });
                        }
                      },
                      value: checkboxvalFourniture,
                    ),
                  ),
                ),

                Card(
                  color: const Color(0xFF6334A9).withOpacity(0.7),
                  child: ListTile(
                    title: Text(
                      textAlign: TextAlign.start,
                      'Informatique',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                    trailing: Switch(
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            checkboxvalinformatique = value;
                          });
                        }
                      },
                      value: checkboxvalinformatique,
                    ),
                  ),
                ),

                Card(
                  color: const Color(0xFF6334A9).withOpacity(0.7),
                  child: ListTile(
                    title: Text(
                      textAlign: TextAlign.start,
                      'Mode',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                    trailing: Switch(
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            checkboxvalMode = value;
                          });
                        }
                      },
                      value: checkboxvalMode,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //       color: const Color(0xFF6334A9).withOpacity(0.5),
                //       borderRadius: BorderRadius.circular(10)),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         textAlign: TextAlign.center,
                //         'Mode',
                //         style: TextStyle(
                //           fontSize: 15.sp,
                //           fontWeight: FontWeight.normal,
                //           color: Colors.white,
                //           fontFamily: 'PlusJakartaSans',
                //         ),
                //       ),
                //       Switch(
                //         onChanged: (bool? value) {
                //           if (value != null) {
                //             setState(() {
                //               checkboxvalMode = value;
                //             });
                //           }
                //         },
                //         value: checkboxvalMode,
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ElevatedButton(
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
                      onPressed: () => {}),
                ),
              ],
            ),
            Align(
              alignment: Alignment(-1, -0.9),
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: const Color(0xFF6334A9),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
