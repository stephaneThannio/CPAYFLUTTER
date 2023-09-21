import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageEror extends StatelessWidget {
  const PageEror({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/items/error/img/notfound.jpg"))),
          ),
          Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                'Element non trouvé',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  // fontFamily: 'PlusJakartaSans',
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'l\'element que vous rechercher est introuvable!',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  // fontFamily: 'PlusJakartaSans',
                ),
              )
            ],
          )
        ]),
      ),
    );
    ;
  }
}
