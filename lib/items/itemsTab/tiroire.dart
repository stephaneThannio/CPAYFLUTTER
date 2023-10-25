import 'package:cpay/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Tiroire extends StatefulWidget {
  const Tiroire({super.key});

  @override
  State<Tiroire> createState() => _TiroireState();
}

class _TiroireState extends State<Tiroire> {
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
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(100)),
                            child: const Icon(
                              size: 100,
                              Icons.person_2_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(100)),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      User.sessionUser!.iban,
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
                  const ListTile(
                    title: Text(
                      textAlign: TextAlign.center,
                      'Scannez ici:',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: QrImageView(
                      data: User.sessionUser!.iban,
                      version: QrVersions.auto,
                      size: 200,
                    ),
                  ),
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
                        'Log out',
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
