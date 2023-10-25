import 'package:cpay/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Tiroiredisconect extends StatefulWidget {
  const Tiroiredisconect({super.key});

  @override
  State<Tiroiredisconect> createState() => _TiroiredisconectState();
}

class _TiroiredisconectState extends State<Tiroiredisconect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              color: const Color(0xFF6334A9),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    SizedBox(
                      //color: Colors.red,
                      height: 150,
                      width: 150,
                      child: Stack(
                        children: [
                          IconButton(
                            icon: Image(
                              height: 150.sp,
                              width: 150.sp,
                              image: const AssetImage('lib/photos/285-min.png'),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Company For Madagascar",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              //color: Colors.amber,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: const Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                      title: const Text(
                        textAlign: TextAlign.center,
                        'Settings',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      onTap: () {
                        print("hello");
                      },
                    ),
                  ),
                  Card(
                    elevation: 2,
                    child: ListTile(
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      title: const Text(
                        textAlign: TextAlign.center,
                        'About us',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      onTap: () {
                        print("hello");
                      },
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
