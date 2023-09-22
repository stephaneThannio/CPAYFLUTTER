import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTimeout extends StatelessWidget {
  final Function func;
  const PageTimeout({super.key, required this.func});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/items/error/img/Sorry.jpg"))),
        ),
        Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              'Une erreur s\'est prouduit',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                // fontFamily: 'PlusJakartaSans',
              ),
            ),
            SizedBox(
              width: 100.sp,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: const Color(0xFF6334A9)),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Réesayer',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontFamily: 'PlusJakartaSans',
                              ),
                            ),
                            const Icon(
                              Icons.restart_alt_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    func();
                  }),
            ),
          ],
        )
      ]),
    );
  }
}
